//
//  LoginPageView.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 26.04.24.
//

import Foundation
import UIKit

class LoginPageView: UIView {
    
    var profileImageViewButton = UIButton()
    var profileCustomBackground = UIImage()
    var mainStackView = UIStackView()
    var username = UITextField()
    var usernameLabel = UILabel()
    var password = UITextField()
    var passwordLabel = UILabel()
    var repeatPassword = UITextField()
    var repeatPasswordLabel = UILabel()
    var loginButton = UIButton()
    
    
    
    func configureProfileImageViewButton() -> UIButton {
        let profileImageViewButton = UIButton()
        profileCustomBackground = UIImage(named: "profilePhoto")!
        addSubview(profileImageViewButton)
        profileImageViewButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageViewButton.topAnchor.constraint(equalTo: topAnchor, constant: 110).isActive = true
        profileImageViewButton.heightAnchor.constraint(equalToConstant: 132).isActive = true
        profileImageViewButton.widthAnchor.constraint(equalToConstant: 132).isActive = true
        profileImageViewButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageViewButton.layer.borderWidth = 1
        profileImageViewButton.layer.borderColor = UIColor(.black).cgColor
        profileImageViewButton.layer.cornerRadius = 66
        profileImageViewButton.contentMode = .center
        profileImageViewButton.setBackgroundImage(profileCustomBackground, for: .normal)
        profileImageViewButton.tintColor = .black
        profileImageViewButton.clipsToBounds = true
        
        return profileImageViewButton
    }
    
    func configureMainStackView() -> UIStackView {
        let mainStackView = UIStackView()
        addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.spacing = 6
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        mainStackView.topAnchor.constraint(equalTo: profileImageViewButton.bottomAnchor, constant: 47).isActive = true
        
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
        labelForInput.setLineHeight(30)
        labelForInput.translatesAutoresizingMaskIntoConstraints = false
        labelForInput.widthAnchor.constraint(equalToConstant: 327).isActive = true
        //labelForInput.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
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
        input.layer.borderColor = UIColor(named: "textcolor")?.cgColor
        
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
        
        return button
    }
    
}
