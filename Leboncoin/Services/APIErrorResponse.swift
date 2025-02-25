//
//  APIErrorResponse.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

struct APIErrorResponse: Codable {
    var code: String?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case message
    }

    init(code: String? = nil, message: String? = nil) {
        self.code = code
        self.message = message
    }

    static let genericError: APIErrorResponse = .init(message: "server_wrong_error".localize)
    static let badURL: APIErrorResponse = .init(message: "server_wrong_url".localize)
    static let invalidData: APIErrorResponse = .init(message: "server_wrong_data".localize)
    static let invalidJSON: APIErrorResponse = .init(message: "server_wrong_model".localize)
}
