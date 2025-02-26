//
//  HomeViewModelTests.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockHomeView: MockHomeView!
    var mockRouter: MockHomeRouter!
    var mockUseCase: MockUseCase!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockUseCase(service: ServiceImpl())
        mockHomeView = MockHomeView()
        mockRouter = MockHomeRouter(viewController: mockHomeView)
        viewModel = HomeViewModel(viewController: mockHomeView,
                                  router: mockRouter,
                                  fetchClassifiedAdsUseCase: mockUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockHomeView = nil
        mockRouter = nil
        mockUseCase = nil
        super.tearDown()
    }

    func testuserInterfaceDidLoad() throws {
        // Given
        mockHomeView.showErrorWasCalled = false
        mockHomeView.showReloadWasCalled = false
        mockUseCase.mockDtos = [MocksFactory.mockDto(id: 1), MocksFactory.mockDto(id: 2), MocksFactory.mockDto(id: 3)]

        let expectation = XCTestExpectation(description: "Data fetched successfully!")
        
        // When
        viewModel.userInterfaceDidLoad()
        
        // Hack-ish to wait for async code to be executed
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2.0)
        
        // Then
        XCTAssertFalse(mockHomeView.showErrorWasCalled)
        XCTAssertTrue(mockHomeView.showReloadWasCalled)
        XCTAssertTrue(mockHomeView.showReloadAds.count == 3)
        XCTAssertTrue(mockHomeView.showReloadAds.last?.id == 3)
    }
    
    func testDidSelectRow() throws {
        // Given
        mockRouter.showDetailsWasCalled = false
        mockRouter.showAdv = nil
        
        // When
        viewModel.didSelectRow(at: MocksFactory.mockDto(id: 4))
        
        // Then
        XCTAssertTrue(mockRouter.showDetailsWasCalled)
        XCTAssertTrue(mockRouter.showAdv?.id == 4)
        XCTAssertTrue(mockHomeView.showReloadAds.count == .zero)
    }

}
