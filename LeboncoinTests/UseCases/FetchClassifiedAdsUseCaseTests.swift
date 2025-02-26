//
//  FetchClassifiedAdsUseCaseTests.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

final class FetchClassifiedAdsUseCaseTests: XCTestCase {
    
    var useCase: FetchClassifiedAdsUseCase!
    
    override func setUp() {
        super.setUp()
        useCase = FetchClassifiedAdsUseCase(service: ServiceImpl())
    }
    
    override func tearDown() {
        useCase = nil
        super.tearDown()
    }
    
    func testFetchClassifiedAdsUseCase() async {
        // Given
        
        // When
        do {
            let ads = try await useCase.execute()
            
            // Then
            XCTAssertFalse(ads.isEmpty)
        } catch {
            XCTAssertTrue(false)
        }
    }
}
