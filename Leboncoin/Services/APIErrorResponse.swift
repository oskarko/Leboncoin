//
//  APIErrorResponse.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

enum APIErrors: Error {
    case genericError
    case badURL
    case invalidData
    case invalidJSON
}

extension APIErrors: LocalizedError {
    public var errorDescription: String? { // A user-friendly description of the error
        switch self {
        case .genericError: return "server_wrong_error".localize
        case .badURL: return "server_wrong_url".localize
        case .invalidData: return "server_wrong_data".localize
        case .invalidJSON: return "server_wrong_model".localize

        }
    }
}
