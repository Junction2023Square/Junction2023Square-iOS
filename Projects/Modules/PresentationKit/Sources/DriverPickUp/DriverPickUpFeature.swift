import Foundation
import ComposableArchitecture
import DomainKit

public struct DriverPickUpFeature: Reducer {
    public init() {

    }

    public struct State: Equatable {
        public init() { }
    }

    public enum Action: Equatable {
        case didTapConfirmButton
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
