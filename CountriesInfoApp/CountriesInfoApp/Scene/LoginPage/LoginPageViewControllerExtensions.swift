//
//  LoginPageViewControllerExtensions.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 28.04.24.
//

import Foundation
import UIKit

extension LoginPageViewController: LoginPageViewModelDelegate {
    func navigateToMainPage(username: String?, password: String?, repeatPassword: String?) {
        let alert = UIAlertController(title: "გილოცავთ!", message: "თქვენ წარმატებით გაიარეთ რეგისტრაცია", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let alertForPassword = UIAlertController(title: "პაროლები არ ემთხვევა!", message: "გთხოვთ სწორად გაიმეოროთ პაროლი", preferredStyle: UIAlertController.Style.alert)
        
        alertForPassword.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let alertForEmptyFields = UIAlertController(title: "ყურადღება!", message: "გთხოვთ შეავსოთ ყველა უჯრა", preferredStyle: UIAlertController.Style.alert)
        
        alertForEmptyFields.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil))
        
        guard let username = username,
              let password = password,
              let repeatPassword = repeatPassword else {
            return
        }
        
        guard !username.isEmpty, !password.isEmpty, !repeatPassword.isEmpty else {
            present(alertForEmptyFields, animated: true, completion: nil)
            return
        }
        
        guard password == repeatPassword else {
            present(alertForPassword, animated: true, completion: nil)
            return
        }
        
        viewModel.someInfoSaved(username: username, password: password)
        UserDefaults.standard.set(true, forKey: "isFirstLogin")
        print(UserDefaults.standard.bool(forKey: "isFirstLogin"))
        navigationController?.pushViewController(MainVC(), animated: true)
        present(alert, animated: true, completion: nil)
        
    }
    
}
//
//extension LoginPageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.editedImage] as? UIImage {
//            loginPageView.profileImageViewButton.setBackgroundImage(image, for: .normal)
//        }
//        dismiss(animated: true)
//    }
//}
