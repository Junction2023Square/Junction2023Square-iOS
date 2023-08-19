//
//  DriverDetailFeature.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/08/19.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import ComposableArchitecture
import DataKit
import DomainKit

import Foundation

public struct DriverDetailFeature: Reducer {
    public init() { }
    
    private let driverReviewListUseCase: DriverReviewUseCaseProtocol = DriverReviewUseCase(
        driverReviewRepository: DriverReviewRepository()
    )
    
    public struct State: Equatable {
        public init(driver: Driver) {
            self.driver = driver
        }
        
        public var driver: Driver
        public var reviewAverage: Double = 0
        var reviews: [DriverReview] = []
        @BindingState public var selectedIndex: Int = 0
        @BindingState public var isSelectedFavorite: Bool = false
    }
    
    public enum Action: Equatable {
        case didTapReservationButton
        case didTapDriverInfo
        case didTapReviewInfo
        case didTapFavoriteButton
        case fetchDriverReview
        case fetchDriverReviewSuccess([DriverReview])
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didTapReservationButton:
                return .none

            case .didTapDriverInfo:
                state.selectedIndex = 0
                return .none

            case .didTapReviewInfo:
                state.selectedIndex = 1
                return .none

            case .didTapFavoriteButton:
                state.isSelectedFavorite.toggle()
                return .none
            case .fetchDriverReview:
                return .run { [state] send in
                    let result = try await driverReviewListUseCase.fetchDriverReviews(driverID: state.driver.driverID)
                    print("🟢 \(result)")
                    await send(.fetchDriverReviewSuccess(result))
                }
            case .fetchDriverReviewSuccess(let reviews):
                state.reviews = reviews
                if reviews.count > 0 {
                    state.reviewAverage = Double(reviews.map({ $0.rating }).reduce(0, { $0 + $1})) / Double(reviews.count)
                }
                return .none
            }
        }
    }
}
