//
//  LoginPageViewController.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 26.04.24.
//

import Foundation
import UIKit

class LoginPageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    //var loginPageView: LoginPageView
    var viewModel: LoginPageViewModel
    var profileImageViewButton = UIButton()
    var mainStackView = UIStackView()
    var username = UITextField()
    var usernameLabel = UILabel()
    var password = UITextField()
    var passwordLabel = UILabel()
    var repeatPassword = UITextField()
    var repeatPasswordLabel = UILabel()
    var loginButton = UIButton()
    let userDefaults = UserDefaults.standard
    let fileManager = FileManager.default
    var documentsDirectoryPath = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
    let keychainManager = KeyChainManager()
    
    init() {
        //self.loginPageView = LoginPageView()
        viewModel = LoginPageViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func loadView() {
    //        view = loginPageView
    //    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundcolor")
        //let isFirstLogin = userDefaults.bool(forKey: "isFirstLogin")
        profileImageViewButton = configureProfileImageViewButton()
        mainStackView = configureMainStackView()
        //debugPrintSavedPassword()
        
    }
    
    func configureProfileImageViewButton() -> UIButton {
        let profileImageViewButton = UIButton()
        view.addSubview(profileImageViewButton)
        profileImageViewButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        profileImageViewButton.heightAnchor.constraint(equalToConstant: 132).isActive = true
        profileImageViewButton.widthAnchor.constraint(equalToConstant: 132).isActive = true
        profileImageViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageViewButton.layer.borderWidth = 1
        profileImageViewButton.layer.borderColor = UIColor(.black).cgColor
        profileImageViewButton.layer.cornerRadius = 66
        profileImageViewButton.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
        profileImageViewButton.contentMode = .center
        profileImageViewButton.tintColor = .black
        profileImageViewButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        
        return profileImageViewButton
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            profileImageViewButton.setImage(image, for: .normal)
        }
        else if let image = info[.originalImage] as? UIImage {
            profileImageViewButton.setImage(image, for: .normal)
        }
    }
    
    @objc func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    func configureMainStackView() -> UIStackView {
        let mainStackView = UIStackView()
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 6
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        mainStackView.topAnchor.constraint(equalTo: profileImageViewButton.bottomAnchor, constant: 47).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -115).isActive = true
        
        usernameLabel = createInputLabel(text: "მომხმარებლის სახელი")
        username = createInputField(placeholder: "შეიყვანეთ მომხმარებლის სახელი")
        passwordLabel = createInputLabel(text: "პაროლი")
        password = createInputField(placeholder: "შეიყვანეთ პაროლი")
        repeatPasswordLabel = createInputLabel(text: "გაიმეორეთ პაროლი")
        repeatPassword = createInputField(placeholder: "განმეორებით შეიყვანეთ პაროლი")
        loginButton = createButton()
        
        mainStackView.addArrangedSubviews(usernameLabel, username, passwordLabel, password, repeatPasswordLabel, repeatPassword, loginButton)
        
        if let username = mainStackView.arrangedSubviews.firstIndex(of: username) {
            mainStackView.setCustomSpacing(50, after: mainStackView.arrangedSubviews[username])
        }
        if let password = mainStackView.arrangedSubviews.firstIndex(of: password) {
            mainStackView.setCustomSpacing(50, after: mainStackView.arrangedSubviews[password])
        }
        
        if let repeatPassword = mainStackView.arrangedSubviews.firstIndex(of: repeatPassword) {
            mainStackView.setCustomSpacing(50, after: mainStackView.arrangedSubviews[repeatPassword])
        }
        
        return mainStackView
    }
    
    func createInputLabel(text: String) -> UILabel {
        
        let labelForInput = UILabel()
        labelForInput.text = text
        labelForInput.textColor = UIColor(named: "textcolor")
        labelForInput.textAlignment = .left
        labelForInput.font.withSize(20)
        labelForInput.translatesAutoresizingMaskIntoConstraints = false
        labelForInput.widthAnchor.constraint(equalToConstant: 327).isActive = true
        labelForInput.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        return labelForInput
    }
    
    func createInputField(placeholder: String) -> UITextField {
        
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholderColor")!])
        input.tintColor = .black
        input.textColor = .black
        input.layer.cornerRadius = 22.5
        input.clipsToBounds = true
        input.backgroundColor = UIColor(named: "inputfieldscolor")
        input.heightAnchor.constraint(equalToConstant: 45).isActive = true
        input.widthAnchor.constraint(equalToConstant: 327).isActive = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: input.frame.height))
        input.leftView = paddingView
        input.leftViewMode = .always
        
        return input
        
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue
        button.widthAnchor.constraint(equalToConstant: 327).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.setTitle("შესვლა", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 22.5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }
    
    public func isFirstLogin() -> Bool {
        userDefaults.set(true, forKey: "isFirstLogin")
        return userDefaults.bool(forKey: "isFirstLogin")
    }
    
    func saveCredentialsToKeychain(username: String, password: String) {
        
        do {
            guard let passwordData = password.data(using: .utf8) else {
                print("Failed to convert password to Data")
                return
            }
            
            try keychainManager.save(
                account: username,
                password: passwordData
            )
            
            print("პაროლი შენახულია")
            
        } catch {
            print("პაროლი არ შენახულა: \(error)")
        }
    }
    
    @objc private func loginButtonTapped() {
        guard let username = username.text,
              let password = password.text,
              let repeatPassword = repeatPassword.text else {
            return
        }
        
        guard !username.isEmpty, !password.isEmpty, password == repeatPassword else {
            return
        }
        
        let alert = UIAlertController(title: "გილოცავთ!", message: "წარმატებით დალოგინდით", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // შევინახოთ ქიჩეინში
        if isFirstLogin() {
            saveCredentialsToKeychain(username: username, password: password)
            userDefaults.set(false, forKey: "isFirstLogin")
        }
        navigationController?.pushViewController(MainVC(), animated: true)
        present(alert, animated: true, completion: nil)
        
    }
    
    //init() {
    //    self.mainPageView = MainPageView()
    //    viewModel = MainPageViewModel()
    //    super.init(nibName: nil, bundle: nil)
    //}
    //
    //required init?(coder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    //}
    //
    //override func loadView() {
    //    view = mainPageView
    //}
    //
    //override func viewDidLoad() {
    //    super.viewDidLoad()
    //    view.backgroundColor = UIColor(named: "backgroundcolor")
    //    mainPageView.searchBar.delegate = self
    //    configureTableView()
    //    title = "Countries"
    //    navigationController?.navigationBar.prefersLargeTitles = true
    //
    //    viewModel.delegate = self
    //    viewModel.viewdidload()
    //
    //}
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
