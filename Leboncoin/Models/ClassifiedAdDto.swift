//
//  ClassifiedAdDto.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

import UIKit

struct ClassifiedAdDto: Codable {
    let id: Int
    let title: String
    let category: String
    let price: Float
    let isUrgent: Bool
    let creationDate: String
    let imagesUrl: ImageURLs
    let description: String
}
