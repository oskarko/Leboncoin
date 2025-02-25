//
//  HomeViewModel.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    weak var viewController: HomeViewUserInterface!
    private let router: HomeRouter
    private let fetchCategoriesUseCase: FetchCategoriesUseCase
    private let fetchClassifiedAdsUseCase: FetchClassifiedAdsUseCase
    
    init(viewController: HomeViewUserInterface,
         router: HomeRouter,
         fetchCategoriesUseCase: FetchCategoriesUseCase,
         fetchClassifiedAdsUseCase: FetchClassifiedAdsUseCase) {
        self.viewController = viewController
        self.router = router
        self.fetchCategoriesUseCase = fetchCategoriesUseCase
        self.fetchClassifiedAdsUseCase = fetchClassifiedAdsUseCase
    }
    
    func userInterfaceDidLoad() {
        fetchCategories()
        fetchAds()
    }
    
    func didSelectRow(at ad: ClassifiedAd) {
        router.showDetails(for: ad)
    }
    
    // MARK: - Helpers
    
    private func fetchCategories() {
        fetchCategoriesUseCase.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let categories):
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.viewController.showError(error.message ?? "")
                }
            }
        }
    }
    
    private func fetchAds() {
        fetchClassifiedAdsUseCase.execute { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let classifiedAds):
                DispatchQueue.main.async {
                    self.viewController.reload(with: classifiedAds)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.viewController.showError(error.message ?? "")
                }
            }
        }
    }
}
