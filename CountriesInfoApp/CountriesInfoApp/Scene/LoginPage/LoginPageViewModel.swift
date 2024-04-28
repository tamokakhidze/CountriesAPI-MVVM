//
//  LoginPageViewModel.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 26.04.24.
//

import Foundation

protocol LoginPageViewModelDelegate: AnyObject {
    func navigateToMainPage(username: String?, password: String?, repeatPassword: String?)
}

class LoginPageViewModel {
    
    let keychainManager = KeyChainManager()
    weak var delegate: LoginPageViewModelDelegate?
    
    func someInfoSaved(username: String, password: String) {
        saveCredentialsToKeychain(username: username, password: password)
    }
    
    func saveCredentialsToKeychain(username: String, password: String) {
        
        do {
            guard let passwordData = password.data(using: .utf8) else {
                print("Failed to convert password to Data")
                return
            }
            
            try keychainManager.save(account: username, password: passwordData)
            
            print("პაროლი შენახულია")
            
        } catch {
            print("პაროლი არ შენახულა: \(error)")
        }
    }
    
    func loginButtonWasTapped(username: String?, password: String?, repeatPassword: String?) {
        delegate?.navigateToMainPage(username: username, password: password, repeatPassword: repeatPassword)
    }
    
    private func navigateToMainPage(username: String, password: String, repeatPassword: String) {
        saveCredentialsToKeychain(username: username, password: password)
        
    }

}
