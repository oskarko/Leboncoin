//
//  MockHomeView.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class MockHomeView: HomeViewController {
    
    var showReloadWasCalled = false
    var showReloadAds: [ClassifiedAdDto] = []
    var showErrorWasCalled = false
    var showErrorMessage = ""
    
    override func reload(with ads: [ClassifiedAdDto]) {
        showReloadWasCalled = true
        showReloadAds = ads
    }
    
    override func showError(_ errorMessage: String) {
        showErrorWasCalled = true
        showErrorMessage = errorMessage
    }
}
