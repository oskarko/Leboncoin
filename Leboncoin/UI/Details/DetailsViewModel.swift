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
    private let adv: ClassifiedAdDto
    
    init(viewController: DetailsViewUserInterface,
         router: DetailsRouter,
         adv: ClassifiedAdDto) {
        self.viewController = viewController
        self.router = router
        self.adv = adv
    }
    
    func userInterfaceDidLoad() {
        viewController.reload(with: adv)
    }
}
