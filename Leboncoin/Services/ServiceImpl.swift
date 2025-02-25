//
//  ServiceImpl.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class ServiceImpl: ServiceProtocol {
    
    func fetch<T: Decodable>(_ type: ServicePath) async throws -> T {
        guard let url = URL(string: type.urlString) else {
            throw APIErrors.badURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            return decoded
        } catch {
            throw APIErrors.invalidJSON
        }
    }
    
}
