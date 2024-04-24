import UIKit

class MainVC: UIViewController {
    
    var mainPageView: MainPageView
    var viewModel: MainPageViewModel
    
    
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
        loadData()
    }
    
    func loadData() {
        viewModel.fetchData() { [weak self] result in
            switch result {
            case .success(let success):
                self?.viewModel.countriesArray = success
                self?.mainPageView.tableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func configureTableView() {
        mainPageView.tableView.rowHeight = 50
        mainPageView.tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        mainPageView.tableView.dataSource = self
        mainPageView.tableView.delegate = self
    }
        
}
