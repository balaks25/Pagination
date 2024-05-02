//
//  ListTableViewController.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import UIKit

class ListTableViewController: UITableViewController {

    var viewModel: ProductListViewModel?
    private let endPoint = "https://jsonplaceholder.typicode.com/posts"
    var loader: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTitle()
        setLoader()
        setupTableView(self.tableView)
        fetchDataFromEndpoint()
    }
    
    private func setLoader() {
        loader = UIActivityIndicatorView(style: .large)
        loader.color = .gray
        loader.center = view.center
        loader.hidesWhenStopped = true
        loader.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loader)
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -150)
        ])
    }
    
    private func setTitle() {
        self.title = AppDelegate.appTitle
    }

    private func setupTableView(_ tableView: UITableView) {
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ProductTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchDataFromEndpoint() {
        guard let url = URL(string: endPoint) else {
            return
        }
        loader.startAnimating()
        NetworkManager.shared.request(url: url, method: .get, parameters: nil) {[weak self] result in
            DispatchQueue.main.async {
                self?.loader.stopAnimating()
            }
            switch result {
            case .success(let data):
                // Handle successful response
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode([ProductListModel].self, from: data)
                    self?.viewModel = ProductListViewModel(data: model)
                } catch let error {
                    // Handle error
                    self?.showAlert(errorMessage: error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                // Handle error
                self?.showAlert(errorMessage: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(errorMessage: String) {
        let alertMessagePopUpBox = UIAlertController(title: AppDelegate.appTitle, message: errorMessage, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alertMessagePopUpBox.addAction(okButton)
        DispatchQueue.main.async {
            self.present(alertMessagePopUpBox, animated: true)
        }
    }
}

extension ListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ProductTableViewCell.self), for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.resetView()
        cell.userIdLabel.text = viewModel?.getId(indexPath.row)
        cell.titleLabel.text = viewModel?.getTitle(indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedProduct = viewModel?.getProduct(indexPath.row) else {
            return
        }
        let methodStart = Date()
        let vc = DetailViewController()
        vc.viewModel = ProductViewModel(data: selectedProduct)
        self.navigationController?.pushViewController(vc, animated: true)
        let methodFinish = Date()
        let executionTime = methodFinish.timeIntervalSince(methodStart)
        print("Execution time: \(executionTime)")
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if (contentHeight - (offsetY + scrollView.frame.height)) < CGFloat(1000) {
            viewModel?.paging += 1
            self.tableView.reloadData()
        }
    }
}
