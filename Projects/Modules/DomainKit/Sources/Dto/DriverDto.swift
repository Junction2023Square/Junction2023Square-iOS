//
//  DriverDto.swift
//  DomainKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation

public struct DriverDto: Codable {
    public var statusCode: Int
    public var value: Value
}

// MARK: - Value
public struct Value: Codable {
    public var itemList: [Driver]
}

// MARK: - ItemList
public struct Driver: Codable, Hashable, Identifiable {
    public var id: String { driverID }
    public var driverID, name: String
    public var drives: Int
    public var averageRating, region: String
    public var carSize: CarSize
    public var profileImgURL: String
    public var createdAt, updatedAt: String

    public enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case name, drives, averageRating, region, carSize
        case profileImgURL = "profileImgUrl"
        case createdAt, updatedAt
    }
    
    public init(driverID: String, name: String, drives: Int, averageRating: String, region: String, carSize: CarSize, profileImgURL: String, createdAt: String, updatedAt: String) {
        self.driverID = driverID
        self.name = name
        self.drives = drives
        self.averageRating = averageRating
        self.region = region
        self.carSize = carSize
        self.profileImgURL = profileImgURL
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

public enum CarSize: String, Codable {
    case large = "LARGE"
    case medium = "MEDIUM"
    case small = "SMALL"
}
