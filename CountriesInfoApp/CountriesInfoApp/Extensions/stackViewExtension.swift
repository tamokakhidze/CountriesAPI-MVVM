//
//  stackViewExtension.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 28.04.24.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
