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
    func reload(with ads: [ClassifiedAdDto])
    func showError(_ errorMessage: String)
}

class HomeViewController: UIViewController, HomeViewUserInterface {
    
    var viewModel: HomeViewModel!
    private var ads: [ClassifiedAdDto] = []
    private var filteredAds: [ClassifiedAdDto] = []
    
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        
        return searchController
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar(withTitle: "Leboncoin", prefersLargeTitles: false)
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
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    private func filterAds(for searchText: String) {
        filteredAds = ads.filter { $0.category.lowercased().contains(searchText.lowercased()) }
        
        tableView.reloadData()
    }
    
    private func isSearchActive() -> Bool {
        searchController.isActive && searchController.searchBar.text != ""
    }
    
    // MARK: - HomeViewUserInterface

    func reload(with ads: [ClassifiedAdDto]) {
        self.ads = ads
        tableView.reloadData()
    }
    
    func showError(_ errorMessage: String) {
        showErrorMessage(errorMessage) // From extension file
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive() ? filteredAds.count : ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
        let adv = isSearchActive() ? filteredAds[indexPath.row] : ads[indexPath.row]
        
        cell.configure(with: adv)
        cell.selectionStyle = .none
        cell.backgroundColor = indexPath.row % 2 == 0 ? .gray.withAlphaComponent(0.2) : .darkGray.withAlphaComponent(0.2)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adv = isSearchActive() ? filteredAds[indexPath.row] : ads[indexPath.row]
        viewModel.didSelectRow(at: adv)
    }
}

// MARK: - UISearchResultsUpdating

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterAds(for: searchController.searchBar.text ?? "")
    }
}
