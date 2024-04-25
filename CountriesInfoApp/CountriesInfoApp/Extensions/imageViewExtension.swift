//
//  imageViewExtension.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 22.04.24.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(with url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                return
            }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
