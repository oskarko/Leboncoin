//
//  MockDetailsView.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 26/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class MockDetailsView: DetailsViewController {
    
    var showReloadWasCalled = false
    var showReloadAdv: ClassifiedAdDto?
    
    override func reload(with adv: ClassifiedAdDto) {
        showReloadWasCalled = true
        showReloadAdv = adv
    }
}
