//
//  HomeViewModel.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class HomeViewModel {
    
    weak var viewController: HomeViewUserInterface!
    private let router: HomeRouter
    private let fetchClassifiedAdsUseCase: FetchClassifiedAdsUseCase
    
    init(viewController: HomeViewUserInterface,
         router: HomeRouter,
         fetchClassifiedAdsUseCase: FetchClassifiedAdsUseCase) {
        self.viewController = viewController
        self.router = router
        self.fetchClassifiedAdsUseCase = fetchClassifiedAdsUseCase
    }
    
    func userInterfaceDidLoad() {
        Task {
            await fetchAds()
        }
    }
    
    func didSelectRow(at adv: ClassifiedAdDto) {
        router.showDetails(for: adv)
    }
    
    // MARK: - Helpers
    
    private func fetchAds() async {
        do {
            let ads = try await fetchClassifiedAdsUseCase.execute()
            
            DispatchQueue.main.async {
                self.viewController.reload(with: ads)
            }
        } catch {
            DispatchQueue.main.async {
                self.viewController.showError(error.localizedDescription)
            }
        }
    }
}
