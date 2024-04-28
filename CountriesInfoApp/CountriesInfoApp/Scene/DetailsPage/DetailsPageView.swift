//
//  DetailsPageView.swift
//  CountriesInfoApp
//
//  Created by Tamuna Kakhidze on 24.04.24.
//

import UIKit

class DetailsPageView: UIView {
    
    var flagImage = UIImageView()
    var mainScrollView = UIScrollView()
    var contentView = UIView()
    var countryName = UILabel()
    var aboutheflag = UILabel()
    var flagDescriopion = UILabel()
    var divider1 = UIView()
    var basicInfo = UILabel()
    var independentLabel = UILabel()
    var independentTextLabel = UILabel()
    var spellingLabel = UILabel()
    var spellingTextLabel = UILabel()
    var capitalLabel = UILabel()
    var capitalTextLabel = UILabel()
    var startOfWeekLabel = UILabel()
    var startOfWeekTextLabel = UILabel()
    var regionLabel = UILabel()
    var regionTextLabel = UILabel()
    var neighborsLabel = UILabel()
    var neighborsTextLabel = UILabel()
    var divider2 = UIView()
    var usefulLinks = UILabel()
    var mapsStack = UIStackView()
    var map1 = UIImageView()
    var map2 = UIImageView()
    var imageToURLMap: [UIImageView: URL] = [:]
    
    func configureScrollView() -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(named: "backgroundcolor")
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        return scrollView
    }
    
    func configureContentView() -> UIView {
        let contentView = UIView()
        mainScrollView.addSubview(contentView)
        contentView.backgroundColor = UIColor(named: "backgroundcolor")
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, multiplier: 1).isActive = true
        
        return contentView
    }
    
    func configureCountryNameLabel() -> UILabel {
        let countryNameLabel = UILabel()
        contentView.addSubview(countryNameLabel)
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48).isActive = true
        countryNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        countryNameLabel.widthAnchor.constraint(equalToConstant: 343).isActive = true
        countryNameLabel.textAlignment = .center
        countryNameLabel.font.withSize(17)
        countryNameLabel.textColor = UIColor(named: "textcolor")
        
        return countryNameLabel
    }
    
    func configureFlagImageView() -> UIImageView {
        let flagImageView = UIImageView()
        contentView.addSubview(flagImageView)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.widthAnchor.constraint(equalToConstant: 343).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: 228).isActive = true
        flagImageView.layer.cornerRadius = 30
        flagImageView.clipsToBounds = true
        flagImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        
        return flagImageView
    }
    
    func flagDescriptionLabel(descriptionText: String?) -> UILabel {
        let description = UILabel()
        contentView.addSubview(description)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.topAnchor.constraint(equalTo: aboutheflag.bottomAnchor, constant: 15).isActive = true
        description.widthAnchor.constraint(equalToConstant: 325).isActive = true
        description.heightAnchor.constraint(equalToConstant: 85).isActive = true
        description.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        description.numberOfLines = 0
        description.textAlignment = .left
        description.text = descriptionText
        description.textColor = UIColor(named: "textcolor")
        
        return description
    }
    
    func createDividerView(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat) -> UIView {
        let divider = UIView()
        contentView.addSubview(divider)
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 312).isActive = true
        divider.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        divider.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        divider.backgroundColor = .lightGray
        
        return divider
    }
    
    func infoLabel(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat, text: String) -> UILabel {
        let label = UILabel()
        contentView.addSubview(label)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        label.widthAnchor.constraint(equalToConstant: 325).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.textAlignment = .left
        label.text = text
        label.textColor = UIColor(named: "textcolor")
        
        return label
    }
    
    func createSomeInfoLabel(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat, text: String) -> UILabel {
        let label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 33).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        label.text = text
        label.textColor = UIColor(named: "textcolor")
        
        return label
    }
    
    func createSomeInfoLabelTextLabels(topAnchor: NSLayoutYAxisAnchor, constant: CGFloat, text: String = "") -> UILabel {
        let label = UILabel()
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -33).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
        label.text = text
        label.numberOfLines = 0
        label.textColor = UIColor(named: "textcolor")
        label.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        return label
    }
    
    func configureMapsStackView() -> UIStackView {
        let mapsStackView = UIStackView()
        contentView.addSubview(mapsStackView)
        mapsStackView.translatesAutoresizingMaskIntoConstraints = false
        mapsStackView.widthAnchor.constraint(equalToConstant: 187).isActive = true
        mapsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        mapsStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        mapsStackView.topAnchor.constraint(equalTo: usefulLinks.bottomAnchor, constant: 15).isActive = true
        mapsStackView.distribution = .equalCentering
        
        return mapsStackView
    }
    
    func configureMap(image: UIImage) -> UIImageView {
        let map = UIImageView()
        mapsStack.addArrangedSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        map.widthAnchor.constraint(equalToConstant: 50).isActive = true
        map.heightAnchor.constraint(equalToConstant: 50).isActive = true
        map.layer.borderWidth = 1
        map.layer.borderColor = UIColor(named: "textcolor")!.cgColor
        map.layer.cornerRadius = 25
        map.contentMode = .center
        map.image = image
        
        return map
    }
}

