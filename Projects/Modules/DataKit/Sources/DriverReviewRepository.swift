//
//  DriverReviewRepository.swift
//  DataKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import DomainKit
import NetworkKit

import Foundation

public final class DriverReviewRepository: DriverReviewRepositoryProtocol {
    public init() { }
    
    private let baseAPIClient: BaseAPIClient = .init()
    
    public func fetchDriverReviews(driverID: String) async throws -> (DriverReviewDto?, Error?) {
        let (result, error): (DriverReviewDto?, Error?) = try await baseAPIClient.requestJSON(
            "driver/\(driverID)/review",
            type: DriverReviewDto.self,
            method: .get
        )
        return (result, error)
    }
}
