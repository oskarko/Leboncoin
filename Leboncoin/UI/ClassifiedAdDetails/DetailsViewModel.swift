//
//  DetailViewModel.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class DetailsViewModel {
    
    weak var viewController: DetailsViewUserInterface!
    private let router: DetailsRouter
    private let ad: ClassifiedAd
    
    init(viewController: DetailsViewUserInterface,
         router: DetailsRouter,
         ad: ClassifiedAd) {
        self.viewController = viewController
        self.router = router
        self.ad = ad
    }
    
    func userInterfaceDidLoad() {
        viewController.reload(with: ad)
    }
}
