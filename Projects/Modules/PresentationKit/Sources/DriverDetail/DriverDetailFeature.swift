//
//  DriverDetailFeature.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/08/19.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import ComposableArchitecture
import DomainKit
import Foundation

public struct DriverDetailFeature: Reducer {
    public init() { }
    
    public struct State: Equatable {
        @BindingState public var selectedIndex: Int = 0
        @BindingState public var isSelectedFavorite: Bool = false

        public init() { }
    }
    
    public enum Action: Equatable {
        case didTapReservationButton
        case didTapDriverInfo
        case didTapReviewInfo
        case didTapFavoriteButton
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
            }
        }
    }
}
