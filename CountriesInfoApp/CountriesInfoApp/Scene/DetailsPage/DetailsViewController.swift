import UIKit

class DetailsViewController: UIViewController {
    
    var detailsPageView: DetailsPageView
    var country: Country
    
    init(country: Country) {
        self.detailsPageView = DetailsPageView()
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = country.name?.official
        navigationController?.navigationBar.prefersLargeTitles = true
        let streetLink = URL(string: country.maps?.openStreetMaps ?? "")
        let googleLink = URL(string: country.maps?.googleMaps ?? "")
        setupTapGestureRecognizer(for: detailsPageView.map1, with: streetLink)
        setupTapGestureRecognizer(for: detailsPageView.map2, with: googleLink)
    }
    
    override func loadView() {
        view = detailsPageView
    }
    
    func setupUI() {
        
        let flagURL = URL(string: country.flags!.png)
        view.backgroundColor = UIColor(named: "backgroundcolor")
        detailsPageView.mainScrollView = detailsPageView.configureScrollView()
        detailsPageView.contentView = detailsPageView.configureContentView()
        
        detailsPageView.flagImage = detailsPageView.configureFlagImageView()
        
        
        detailsPageView.flagImage.setImage(with: flagURL!)

        detailsPageView.aboutheflag = detailsPageView.infoLabel(topAnchor: detailsPageView.flagImage.bottomAnchor, constant: 25, text: "About the flag")
        detailsPageView.flagDescriopion = detailsPageView.flagDescriptionLabel(descriptionText: country.flags?.alt ?? "This flag does not have a description")
        
        detailsPageView.divider1 = detailsPageView.createDividerView(topAnchor: detailsPageView.flagDescriopion.bottomAnchor, constant: 20)
        
        detailsPageView.basicInfo = detailsPageView.infoLabel(topAnchor: detailsPageView.divider1.bottomAnchor, constant: 24, text: "Basic information")
        detailsPageView.independentLabel = detailsPageView.createSomeInfoLabel(topAnchor: detailsPageView.basicInfo.bottomAnchor, constant: 15, text: "Independent:")
        detailsPageView.independentTextLabel = detailsPageView.createSomeInfoLabelTextLabels(topAnchor: detailsPageView.basicInfo.bottomAnchor, constant: 15, text: String((country.independent) ?? false).uppercased())
        
        detailsPageView.spellingLabel = detailsPageView.createSomeInfoLabel(topAnchor: detailsPageView.independentLabel.bottomAnchor, constant: 15, text: "Spelling:")
        detailsPageView.spellingTextLabel = detailsPageView.createSomeInfoLabelTextLabels(topAnchor: detailsPageView.independentTextLabel.bottomAnchor, constant: 15, text: country.altSpellings?[0] ?? "None")
        
        detailsPageView.capitalLabel = detailsPageView.createSomeInfoLabel(topAnchor: detailsPageView.spellingLabel.bottomAnchor, constant: 15, text: "Capital")
        detailsPageView.capitalTextLabel = detailsPageView.createSomeInfoLabelTextLabels(topAnchor: detailsPageView.spellingTextLabel.bottomAnchor, constant: 15, text: country.capital?[0] ?? "Capital")
        
        detailsPageView.startOfWeekLabel = detailsPageView.createSomeInfoLabel(topAnchor: detailsPageView.capitalLabel.bottomAnchor, constant: 15, text: "Start of week:")
        detailsPageView.startOfWeekTextLabel = detailsPageView.createSomeInfoLabelTextLabels(topAnchor: detailsPageView.capitalTextLabel.bottomAnchor, constant: 15, text: country.startOfWeek ?? "Monday")
        
        detailsPageView.regionLabel = detailsPageView.createSomeInfoLabel(topAnchor: detailsPageView.startOfWeekLabel.bottomAnchor, constant: 15, text: "Region:")
        detailsPageView.regionTextLabel = detailsPageView.createSomeInfoLabelTextLabels(topAnchor: detailsPageView.startOfWeekTextLabel.bottomAnchor, constant: 15, text: country.region ?? "Earth")
        
        detailsPageView.neighborsLabel = detailsPageView.createSomeInfoLabel(topAnchor: detailsPageView.regionLabel.bottomAnchor, constant: 15, text: "Neighbors:")
        detailsPageView.neighborsTextLabel = detailsPageView.createSomeInfoLabelTextLabels(topAnchor: detailsPageView.regionTextLabel.bottomAnchor, constant: 15, text: country.borders?.joined(separator: ", ") ?? "None")
        detailsPageView.divider2 = detailsPageView.createDividerView(topAnchor: detailsPageView.neighborsLabel.bottomAnchor, constant: 20)
        
        detailsPageView.usefulLinks = detailsPageView.infoLabel(topAnchor: detailsPageView.divider2.bottomAnchor, constant: 24, text: "Useful links")
        detailsPageView.mapsStack = detailsPageView.configureMapsStackView()
        detailsPageView.map1 = detailsPageView.configureMap(image: UIImage(named:"streetmap")!)
        detailsPageView.map2 = detailsPageView.configureMap(image: UIImage(named: "google")!)
        
    }
    
    
    func setupTapGestureRecognizer(for imageView: UIImageView, with url: URL?) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
        
        if let url = url {
            detailsPageView.imageToURLMap[imageView] = url
        }
    }
    
    @objc func imageTapped(_ gesture: UITapGestureRecognizer) {
        guard let imageView = gesture.view as? UIImageView else {
            return
        }
        
        if let url = detailsPageView.imageToURLMap[imageView] {
            UIApplication.shared.open(url)
        }
    }
}
