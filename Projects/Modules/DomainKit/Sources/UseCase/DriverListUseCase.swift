//
//  DriverListUseCase.swift
//  DomainKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation

public protocol DriverListUseCaseProtocol {
    func getDrivers() async throws -> [Driver]
}

public final class DriverListUseCase: DriverListUseCaseProtocol {
    private let driverRepository: DriverRepositoryProtocol
    
    public init(driverRepository: DriverRepositoryProtocol) {
        self.driverRepository = driverRepository
    }
    
    public func getDrivers() async throws -> [Driver] {
        let (result, error) = try await driverRepository.getDrivers()
        if let error = error {
            throw error
        }
        return result?.value.itemList ?? []
    }
}
