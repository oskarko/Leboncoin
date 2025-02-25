//
//  ClassifiedAd.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import UIKit

struct ClassifiedAd: Codable {
    let id: Int
    let title: String
    let categoryId: Int
    let price: Float
    let isUrgent: Bool
    let creationDate: String
    let imagesUrl: ImageURLs
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case categoryId = "category_id"
        case price
        case isUrgent = "is_urgent"
        case creationDate = "creation_date"
        case imagesUrl = "images_url"
        case description
    }
}

struct ImageURLs: Codable {
    let small: String?
    let thumb: String?
}
