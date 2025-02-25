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
    
    func fetch<T: Decodable>(_ type: ServicePath, completion: @escaping (ResultResponse<T>) -> Void) {
        guard let url = URL(string: type.urlString) else {
            completion(.failure(.badURL))
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(.genericError))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.invalidJSON))
            }
        }
        task.resume()
    }
    
}
