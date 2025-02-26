//
//  MocksFactory.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class MocksFactory {
    static func mockDto(id: Int) -> ClassifiedAdDto {
        .init(id: id,
              title: "mock title",
              category: "mock category",
              price: 22,
              isUrgent: false,
              creationDate: "2025-02-25T20:00:31+0000",
              imagesUrl: .init(small: nil, thumb: nil),
              description: "mock description")
    }
}
