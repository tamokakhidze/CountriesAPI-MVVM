//
//  MainPageView.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 24.04.24.
//

import UIKit

class MainPageView: UIView {
    
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableView() {
        addSubview(tableView)
        addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 130).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7).isActive = true
        searchBar.autocapitalizationType = .words
        searchBar.backgroundImage = UIImage()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 18).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 3).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27).isActive = true
        tableView.backgroundColor = UIColor(named: "backgroundcolor")
    }
    
}

#Preview {
    MainVC()
}
