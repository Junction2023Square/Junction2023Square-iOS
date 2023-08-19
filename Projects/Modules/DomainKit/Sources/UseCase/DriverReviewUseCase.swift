//
//  DriverReviewUseCase.swift
//  DomainKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation

public protocol DriverReviewUseCaseProtocol {
    func fetchDriverReviews(driverID: String) async throws -> [DriverReview]
}

public final class DriverReviewUseCase: DriverReviewUseCaseProtocol {
    private let driverReviewRepository: DriverReviewRepositoryProtocol
    
    public init(driverReviewRepository: DriverReviewRepositoryProtocol) {
        self.driverReviewRepository = driverReviewRepository
    }
    
    public func fetchDriverReviews(driverID: String) async throws -> [DriverReview] {
        let (result, error) = try await driverReviewRepository.fetchDriverReviews(driverID: driverID)
        if let error = error {
            throw error
        }
        return result?.value.itemList ?? []
    }
}
