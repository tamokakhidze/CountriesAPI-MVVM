//
//  MainPageViewModel.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 24.04.24.
//
import Foundation
//import UIKit

protocol CountriesViewModelDelegate: AnyObject {
    func countriesFetched(_ countries: [Country])
    func configureCell(_ cell: CountryCell, indexPath: IndexPath)
    func navigateToDetailsPage(country: Country) //Using to populate details page with infoo
}

class MainPageViewModel {
    
    var countriesArray = [Country]()
    var urlString = "https://restcountries.com/v3.1/all"
    var searchingCountry = [Country]()
    var userSeaching: Bool = false
    weak var delegate: CountriesViewModelDelegate?
    
    func viewdidload() {
        fetchData() { [weak self] result in
            switch result {
            case .success(let success):
                self?.countriesArray = success
                self?.delegate?.countriesFetched(self!.countriesArray)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func fetchData(completion: @escaping (Result<[Country], Error>) -> Void) {
        NetworkService().getData(urlString: urlString, completion: completion)
    }
    
    func didSelectRow(index: IndexPath) {
        delegate?.navigateToDetailsPage(country: countriesArray[index.section])
    }
    
    
    func configureCell(_ cell: CountryCell, at indexPath: IndexPath) {
        let country = countriesArray[indexPath.section]
        if userSeaching {
            cell.configureCell(name: searchingCountry[indexPath.section].name!.official, image: searchingCountry[indexPath.section].flags!.png)
            //delegate?.cellsDidLoad(cell, indexPath: indexPath)
        }
        else {
            cell.configureCell(name: country.name!.official, image: country.flags!.png)
            //delegate?.cellsDidLoad(cell, indexPath: indexPath)
        }
    }
    
//    func cellForRow(cell: CountryCell, at indexPath: IndexPath) {
//        delegate?.cellsDidLoad(cell, indexPath: indexPath)
//    }
    
    var filteredCountry = [Country]()
    
}





