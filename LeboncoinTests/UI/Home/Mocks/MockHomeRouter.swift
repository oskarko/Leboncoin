//
//  MockHomeRouter.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class MockHomeRouter: HomeRouter {
    
    var showDetailsWasCalled = false
    var showAdv: ClassifiedAdDto?
    
    override func showDetails(for adv: ClassifiedAdDto) {
        showDetailsWasCalled = true
        showAdv = adv
    }
}
