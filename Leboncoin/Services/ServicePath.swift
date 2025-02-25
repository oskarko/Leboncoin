//
//  ServicePath.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum ServicePath {
    case categories
    case classifiedAds
    
    var urlString: String {
        switch self {
        case .categories: return "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json"
        case .classifiedAds: return "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"
        }
    }
}
