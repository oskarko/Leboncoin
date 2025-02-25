//
//  LeboncoinTests.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest
@testable import Leboncoin

final class LeboncoinTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// MARK: - Unit Tests
final class ClassifiedAdsTests: XCTestCase {
    func testFetchClassifiedAdsUseCase() {
        let apiService = APIService()
        let useCase = FetchClassifiedAdsUseCase(apiService: apiService)
        let expectation = self.expectation(description: "Fetch classified ads")
        
        useCase.execute { ads in
            XCTAssertFalse(ads.isEmpty)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testViewModelFetchAds() {
        let apiService = APIService()
        let useCase = FetchClassifiedAdsUseCase(apiService: apiService)
        let viewModel = ClassifiedAdsViewModel(fetchClassifiedAdsUseCase: useCase)
        let expectation = self.expectation(description: "ViewModel fetch ads")
        
        viewModel.onDataUpdated = {
            XCTAssertFalse(viewModel.classifiedAds.isEmpty)
            expectation.fulfill()
        }
        
        viewModel.fetchAds()
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
