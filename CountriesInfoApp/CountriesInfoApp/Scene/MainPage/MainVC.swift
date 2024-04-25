import UIKit

class MainVC: UIViewController {
    
    var mainPageView: MainPageView
    var viewModel: MainPageViewModel
    var countries: [Country] = []
    
    
    init() {
        self.mainPageView = MainPageView()
        viewModel = MainPageViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundcolor")
        mainPageView.searchBar.delegate = self
        configureTableView()
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.delegate = self
        viewModel.viewdidload()
        
    }
    
    func configureTableView() {
        mainPageView.tableView.rowHeight = 50
        mainPageView.tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        mainPageView.tableView.dataSource = self
        mainPageView.tableView.delegate = self
    }
    
}



