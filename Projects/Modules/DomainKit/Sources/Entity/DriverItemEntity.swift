//
//  DriverItemEntity.swift
//  DomainKit
//
//  Created by Derrick kim on 2023/08/19.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation

public struct DriverItemEntity: Equatable, Identifiable {
    public let id: UUID
    public let name: String
    public let driverImageURL: String
    public let ratingCount: Int
    public let driverHistoryCount: Int
    public let hashtag: [String]

    public init(id: UUID, name: String, driverImageURL: String, ratingCount: Int, driverHistoryCount: Int, hashtag: [String]) {
        self.id = id
        self.name = name
        self.driverImageURL = driverImageURL
        self.ratingCount = ratingCount
        self.driverHistoryCount = driverHistoryCount
        self.hashtag = hashtag
    }
}
