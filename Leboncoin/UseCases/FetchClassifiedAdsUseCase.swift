//
//  FetchClassifiedAdsUseCase.swift
//  Leboncoin
//
//  Created by Oscar Rodriguez Garrucho on 25/2/25
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2025 Oscar Rodriguez Garrucho. All rights reserved.
//

import Foundation

class FetchClassifiedAdsUseCase {
    private let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func execute() async throws -> [ClassifiedAdDto] {
        async let ads: [ClassifiedAd] = service.fetch(.classifiedAds)
        async let categories: [Category] = service.fetch(.categories)
        
        return try await map(ads: ads, categories: categories)
    }
    
    private func map(ads: [ClassifiedAd], categories: [Category]) -> [ClassifiedAdDto] {
        ads.compactMap { adv in
            ClassifiedAdDto(id: adv.id,
                            title: adv.title,
                            category: categories.filter({ $0.id == adv.categoryId }).first?.name ?? "",
                            price: adv.price,
                            isUrgent: adv.isUrgent,
                            creationDate: adv.creationDate,
                            imagesUrl: adv.imagesUrl,
                            description: adv.description)
        }
        .sorted { $0.creationDate > $1.creationDate }
        .sorted  { $0.isUrgent && !$1.isUrgent }
    }
}
