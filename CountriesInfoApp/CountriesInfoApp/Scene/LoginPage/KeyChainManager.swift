//
//  KeyChainManager.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 26.04.24.
//

import Foundation


import UIKit

class KeyChainManager {
    
    enum KeyChainError: Error {
        case sameItemFound
        case unknown
    }
    
    func save(account: String, password: Data) throws {
        
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account as AnyObject,
            kSecValueData as String: password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
        
        print("saved")
    }
    
}
