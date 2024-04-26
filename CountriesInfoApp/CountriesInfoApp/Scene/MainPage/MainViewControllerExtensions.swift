//  MainViewControllerExtensions.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 24.04.24.
//

import UIKit

extension MainVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if viewModel.userSeaching {
            return viewModel.searchingCountry.count
        }
        else {
            return viewModel.countriesArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") as? CountryCell
        cell?.backgroundColor = .clear
        viewModel.configureCell(cell!, at: indexPath)
        //cellsDidLoad(cell!, indexPath: indexPath)
        return cell!
        
    }
    
}

extension MainVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var countryItem = viewModel.countriesArray[indexPath.section]
        
        if viewModel.userSeaching {
            countryItem = viewModel.searchingCountry[indexPath.section]
        }
        
        else {
            countryItem = viewModel.countriesArray[indexPath.section]
        }
        
        if viewModel.countriesArray.firstIndex(where: { $0.altSpellings?[0] == countryItem.altSpellings?[0] }) != nil {
            navigateToDetailsPage(country: countryItem)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    
}

extension MainVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchingCountry = viewModel.countriesArray.filter( {
            $0.name!.official.prefix(searchText.count) == searchText
        })
        viewModel.userSeaching = true
        mainPageView.tableView.reloadData()
    }
}


extension MainVC: CountriesViewModelDelegate {
    func configureCell(_ cell: CountryCell, indexPath: IndexPath) {
        
    }
    
   
    func countriesFetched(_ countries: [Country]) {
        self.countries = countries
        DispatchQueue.main.async {
            self.mainPageView.tableView.reloadData()
        }
        
    }
    
    func navigateToDetailsPage(country: Country) {
        let detailsVC = DetailsViewController(country: country)
        navigationController?.pushViewController(detailsVC, animated: true)

    }
    
    func cellsDidLoad(_ cell: CountryCell, indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
}
