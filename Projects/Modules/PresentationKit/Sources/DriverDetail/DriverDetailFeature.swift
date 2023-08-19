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
        public var driverItem: DriverItemEntity

        public init(driverItem: DriverItemEntity) {
            self.driverItem = driverItem
        }
    }
    
    public enum Action: Equatable {
        case didTapReservationButton
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didTapReservationButton:

                return .none
            }
        }
    }
}

