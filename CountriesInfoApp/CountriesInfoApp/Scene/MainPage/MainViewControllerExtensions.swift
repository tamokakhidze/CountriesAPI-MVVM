//
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
        let country = viewModel.countriesArray[indexPath.section]
        //let current = viewModel.searchingCountry[indexPath.section]
        if viewModel.userSeaching {
            cell!.configureCell(name: viewModel.searchingCountry[indexPath.section].name!.official, image: viewModel.searchingCountry[indexPath.section].flags!.png)
        }
        else {
            cell!.configureCell(name: country.name!.official, image: country.flags!.png)
        }
        print("row: \(indexPath.row), section: \(indexPath.section) is creating")
        
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
        
        let region = countryItem.region
        let borders = countryItem.borders
        var bordersFive = [String]()
        
        if let borders = borders {
            bordersFive = Array(borders.prefix(5))
        }
        else {
            bordersFive = ["None"]
        }
        
        let alt: String?
        let flagAlt = countryItem.flags?.alt
        let name = (countryItem.name?.official)!
        let independent = countryItem.independent
        let capital = countryItem.capital
        let flagUrl = countryItem.flags!.png
        let streetLink = URL(string: countryItem.maps?.openStreetMaps ?? "")
        let googleLink = URL(string: countryItem.maps?.googleMaps ?? "")
        let startOfWeek = countryItem.startOfWeek

        if let altSpellings = countryItem.altSpellings, altSpellings.indices.contains(1) {
            alt = altSpellings[1]
        } else if let altSpellings = countryItem.altSpellings?.first {
            alt = altSpellings
        } else {
            alt = nil
        }
        

        if viewModel.countriesArray.firstIndex(where: { $0.altSpellings?[0] == countryItem.altSpellings?[0] }) != nil {
            let detailsVC = DetailsViewController(name: name, flagUrl: flagUrl)
            detailsVC.detailsPageView.region = region
            detailsVC.detailsPageView.borders = bordersFive
            detailsVC.detailsPageView.altspellings = alt
            detailsVC.detailsPageView.flagAlt = flagAlt
            detailsVC.detailsPageView.independent = independent
            detailsVC.detailsPageView.capital = capital
            detailsVC.detailsPageView.streetMapLink = streetLink
            detailsVC.detailsPageView.googleLink = googleLink
            detailsVC.detailsPageView.startOfWeek = startOfWeek
            navigationController?.pushViewController(detailsVC, animated: true)
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

