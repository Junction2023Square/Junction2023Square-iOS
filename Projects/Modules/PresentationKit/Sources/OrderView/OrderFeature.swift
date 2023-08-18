//
//  OrderFeature.swift
//  PresentationKit
//
//  Created by Derrick kim on 2023/08/19.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import Foundation
import ComposableArchitecture

public struct OrderFeature: Reducer {
    public init() {
        
    }

    public struct State: Equatable {
        public var counts: [Int] = Array(repeating: 0, count: 13)
        public init() { }
    }

    public enum Action: Equatable {
        case decrementButtonTapped(index: Int)
        case incrementButtonTapped(index: Int)
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped(let index):
                if state.counts[index] > 0 {
                    state.counts[index] -= 1
                }
                return .none

            case .incrementButtonTapped(let index):
                state.counts[index] += 1
                return .none
            }
        }
    }
}
