//
//  HomeRouter.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

struct Home {
    let viewController: HomeViewController
    let viewModel: HomeViewModel
    let router: HomeRouter
}

class HomeRouter {
    
    private(set) weak var viewController: HomeViewController!
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }

    // MARK: - Helpers
    
    static func getViewController() -> UINavigationController {
        let configuration = configureModule()
        let navigationController = UINavigationController(rootViewController: configuration.viewController)
        
        return navigationController
    }
    
    private static func configureModule() -> Home {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let service = ServiceImpl()
        let fetchClassifiedAdsUseCase = FetchClassifiedAdsUseCase(service: service)
        let viewModel = HomeViewModel(viewController: viewController,
                                      router: router,
                                      fetchClassifiedAdsUseCase: fetchClassifiedAdsUseCase)

        viewController.viewModel = viewModel

        return Home(viewController: viewController, viewModel: viewModel, router: router)
    }
    
    // MARK: - Routes

    func showDetails(for ad: ClassifiedAdDto) {
        let detailsView = DetailsRouter.getViewController(for: ad)
        self.viewController?.navigationController?.pushViewController(detailsView, animated: true)
    }
    
}
