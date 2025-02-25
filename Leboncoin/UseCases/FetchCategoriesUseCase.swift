//
//  FetchCategoriesUseCase.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class FetchCategoriesUseCase {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func execute(completion: @escaping (ResultResponse<[Category]>) -> Void) {
        service.fetch(.categories) { result in
            completion(result)
        }
    }
}
