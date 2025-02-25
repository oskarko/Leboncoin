//
//  DetailRouter.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

struct Details {
    let viewController: DetailsViewController
    let viewModel: DetailsViewModel
    let router: DetailsRouter
}

class DetailsRouter {
    
    private(set) weak var viewController: DetailsViewController!
    
    init(viewController: DetailsViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Helpers
    
    static func getViewController(for adv: ClassifiedAdDto) -> UIViewController {
        let configuration = configureModule(adv: adv)
        
        return configuration.viewController
    }
    
    private static func configureModule(adv: ClassifiedAdDto) -> Details {
        let viewController = DetailsViewController()
        let router = DetailsRouter(viewController: viewController)
        let viewModel = DetailsViewModel(viewController: viewController,
                                         router: router,
                                         adv: adv)
        
        viewController.viewModel = viewModel
        
        return Details(viewController: viewController, viewModel: viewModel, router: router)
    }
}
