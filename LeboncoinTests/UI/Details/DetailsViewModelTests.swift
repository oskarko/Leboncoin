//
//  DetailsViewModelTests.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import XCTest

final class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!
    var mockDetailsView: MockDetailsView!
    var mockRouter: MockDetailsRouter!
    
    override func setUp() {
        super.setUp()
        mockDetailsView = MockDetailsView()
        mockRouter = MockDetailsRouter(viewController: mockDetailsView)
        viewModel = DetailsViewModel(viewController: mockDetailsView,
                                     router: mockRouter, 
                                     adv: MocksFactory.mockDto(id: 22))
    }
    
    override func tearDown() {
        viewModel = nil
        mockDetailsView = nil
        mockRouter = nil
        super.tearDown()
    }

    func testuserInterfaceDidLoad() throws {
        // Given
        mockDetailsView.showReloadWasCalled = false
        mockDetailsView.showReloadAdv = nil
        
        // When
        viewModel.userInterfaceDidLoad()
        
        // Then
        XCTAssertTrue(mockDetailsView.showReloadWasCalled)
        XCTAssertNotNil(mockDetailsView.showReloadAdv)
        XCTAssertTrue(mockDetailsView.showReloadAdv?.id == 22)
    }

}
