//
//  DriverReviewRepositoryProtocol.swift
//  DomainKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation

public protocol DriverReviewRepositoryProtocol {
    func fetchDriverReviews(driverID: String) async throws -> (DriverReviewDto?, Error?)
}
