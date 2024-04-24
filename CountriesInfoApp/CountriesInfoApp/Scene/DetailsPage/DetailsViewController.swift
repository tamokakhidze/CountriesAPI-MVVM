import UIKit

class DetailsViewController: UIViewController {

    var detailsPageView: DetailsPageView
    var viewModel: DetailsPageViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsPageView.setupUI()
        title = detailsPageView.name
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTapGestureRecognizer(for: detailsPageView.map1, with: detailsPageView.streetMapLink)
        setupTapGestureRecognizer(for: detailsPageView.map2, with: detailsPageView.googleLink)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailsPageView
    }
    
    init(name: String, flagUrl: String) {
        self.detailsPageView = DetailsPageView(frame: .zero, name: name, flagUrl: flagUrl)
        viewModel = DetailsPageViewModel()
        super.init(nibName: nil, bundle: nil)
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
            viewModel.updateView(url: url)
        }
    }
}
