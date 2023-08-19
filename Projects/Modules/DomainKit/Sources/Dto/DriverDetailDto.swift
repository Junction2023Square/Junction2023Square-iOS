//
//  DriverDetailDto.swift
//  DomainKit
//
//  Created by 고병학 on 2023/08/20.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation

// MARK: - Welcome
public struct DriverReviewDto: Codable {
    public var statusCode: Int
    public var value: DriverReviewPayload

    public init(statusCode: Int, value: DriverReviewPayload) {
        self.statusCode = statusCode
        self.value = value
    }
}

// MARK: - Value
public struct DriverReviewPayload: Codable {
    public var itemList: [DriverReview]

    public init(itemList: [DriverReview]) {
        self.itemList = itemList
    }
}

// MARK: - ItemList
public struct DriverReview: Codable, Hashable, Equatable {
    public var reviewID, createdAt, updatedAt, tripID: String
    public var rating: Int
    public var content, title: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case createdAt, updatedAt
        case tripID = "tripId"
        case rating, content, title
    }

    public init(reviewID: String, createdAt: String, updatedAt: String, tripID: String, rating: Int, content: String, title: String) {
        self.reviewID = reviewID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.tripID = tripID
        self.rating = rating
        self.content = content
        self.title = title
    }
}
