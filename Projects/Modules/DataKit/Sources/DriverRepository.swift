//
//  DriverRepository.swift
//  DataKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import DomainKit
import NetworkKit

import Foundation

public final class DriverRepository: DriverRepositoryProtocol {
    public init() { }
    
    private let baseAPIClient: BaseAPIClient = .init()
    
    public func getDrivers() async throws -> (DriverDto?, Error?) {
        let (result, error): (DriverDto?, Error?) = try await baseAPIClient.requestJSON(
            "driver",
            type: DriverDto.self,
            method: .get
        )
        return (result, error)
    }
}
