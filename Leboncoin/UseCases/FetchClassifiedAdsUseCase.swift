//
//  FetchClassifiedAdsUseCase.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

final class FetchClassifiedAdsUseCase {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func execute(completion: @escaping (ResultResponse<[ClassifiedAd]>) -> Void) {
        service.fetch(.classifiedAds) { result in
            completion(result)
        }
    }
}
