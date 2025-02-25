//
//  HomeViewController.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

protocol HomeViewUserInterface: AnyObject {
    func reload(with ads: [ClassifiedAd])
    func showError(_ errorMessage: String)
}

final class HomeViewController: UIViewController {
    
    var viewModel: HomeViewModel!
    private var ads: [ClassifiedAd] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ClassifiedAdCell.self,
                           forCellReuseIdentifier: ClassifiedAdCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.userInterfaceDidLoad()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassifiedAdCell.identifier, for: indexPath) as! ClassifiedAdCell
        let ad = ads[indexPath.row]
        cell.configure(with: ad)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ad = ads[indexPath.row]
        viewModel.didSelectRow(at: ad)
    }
}

// MARK: - HomeViewUserInterface

extension HomeViewController: HomeViewUserInterface {
    func reload(with ads: [ClassifiedAd]) {
        self.ads = ads
        tableView.reloadData()
    }
    
    func showError(_ errorMessage: String) {
        showErrorMessage(errorMessage) // From extension file
    }
}
