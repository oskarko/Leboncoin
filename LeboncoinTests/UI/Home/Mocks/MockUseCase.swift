//
//  MockUseCase.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class MockUseCase: FetchClassifiedAdsUseCase {
    
    var mockDtos: [ClassifiedAdDto] = []
    
    override func execute() async throws -> [ClassifiedAdDto] {
        return mockDtos
    }
}
