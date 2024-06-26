//
//  LoginPageViewController.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 26.04.24.
//

import Foundation
import UIKit

class LoginPageViewController: UIViewController {
    
    var loginPageView: LoginPageView
    var viewModel: LoginPageViewModel
    let fileManager = FileManager.default
    var documentsDirectoryPath = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
    let keychainManager = KeyChainManager()
    
    init() {
        self.loginPageView = LoginPageView()
        viewModel = LoginPageViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupUI()
        addActions()
    }
    
    func setDelegates() {
        viewModel.delegate = self
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundcolor")
        loginPageView.profileImageViewButton = loginPageView.configureProfileImageViewButton()
        loginPageView.mainStackView = loginPageView.configureMainStackView()
    }
    
    func addActions() {
        loginPageView.profileImageViewButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
        loginPageView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc func addImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    
    @objc private func loginButtonTapped() {
        viewModel.loginButtonWasTapped(username: loginPageView.username.text, password: loginPageView.password.text, repeatPassword: loginPageView.repeatPassword.text)
    }
    
}

extension LoginPageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            loginPageView.profileImageViewButton.setBackgroundImage(image, for: .normal)
            if let imageData = image.jpegData(compressionQuality: 1.0),
               let documentsDirectoryPath = documentsDirectoryPath {
                let filename = ("\(image.hashValue).png")
                let fileURL = documentsDirectoryPath.appendingPathComponent(filename)
                do {
                    try imageData.write(to: fileURL)
                    print("ფოტო შენახულია")
                } catch {
                    print("ფოტო არ შენახულა:", error)
                }
            }
        }
        dismiss(animated: true)
    }
}
