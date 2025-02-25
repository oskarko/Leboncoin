//
//  ServiceProtocol.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func fetch<T: Decodable>(_ type:ServicePath, completion: @escaping (ResultResponse<T>) -> Void)
}
