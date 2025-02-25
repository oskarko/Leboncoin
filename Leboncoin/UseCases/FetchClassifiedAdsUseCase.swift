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
    
    func execute() async throws -> [ClassifiedAdDto] {
        async let ads: [ClassifiedAd] = service.fetch(.classifiedAds)
        async let categories: [Category] = service.fetch(.categories)
        
        return try await map(ads: ads, categories: categories)
    }
    
    private func map(ads: [ClassifiedAd], categories: [Category]) -> [ClassifiedAdDto] {
        ads.compactMap { ad in
            ClassifiedAdDto(id: ad.id,
                            title: ad.title,
                            category: categories.filter({ $0.id == ad.categoryId }).first?.name ?? "",
                            price: ad.price,
                            isUrgent: ad.isUrgent,
                            creationDate: ad.creationDate,
                            imagesUrl: ad.imagesUrl,
                            description: ad.description)
        }
        .sorted { $0.creationDate > $1.creationDate }
        .sorted  { $0.isUrgent && !$1.isUrgent }
    }
}
