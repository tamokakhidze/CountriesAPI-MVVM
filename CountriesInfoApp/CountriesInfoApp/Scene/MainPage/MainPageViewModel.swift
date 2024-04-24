//
//  MainPageViewModel.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 24.04.24.
//

import Foundation
import UIKit

class MainPageViewModel {
    
    var countriesArray = [Country]()
    var urlString = "https://restcountries.com/v3.1/all"
    var searchingCountry = [Country]()
    var userSeaching: Bool = false

    func fetchData(completion: @escaping (Result<[Country], Error>) -> Void) {
        NetworkService().getData(urlString: urlString, completion: completion)
    }
    
    var countryNames: [String] {
        countriesArray.map { country in
            country.name!.official
        }
    }
    
    var filteredCountry = [Country]()

}
