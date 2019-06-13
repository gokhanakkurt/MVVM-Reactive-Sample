//
//  HomeViewController.swift
//  MVVM-Reactive-Sample
//
//  Created by Gokhan Akkurt on 13.06.2019.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindEvents()
    }
}

// MARK: - Mix
extension HomeViewController {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // estimated height (dynamically set)
        self.tableView.estimatedRowHeight = 70
        // register cell
        self.tableView.register(cellType: UserTableViewCell.self)
    }
    
    private func bindEvents() {
        viewModel.isLoading
            .signal
            .take(during: reactive.lifetime)
            .observeValues({ (loading) in
                if loading {
                    // show page loading indicator
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }else {
                    // hide page loading indicator
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            })
        
        viewModel.error
            .signal
            .take(during: reactive.lifetime)
            .observeValues({ (error) in
                // show error message
            })
        
        viewModel.viewModels
            .signal
            .take(during: reactive.lifetime)
            .observe({ [weak self] (viewModels) in
                self?.tableView.reloadData()
            })
        
        // fetch home feed
        viewModel.fetchUsers()
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.viewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.viewModel.viewModels.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        viewModel.setupView(cell)
        return cell
    }
}
