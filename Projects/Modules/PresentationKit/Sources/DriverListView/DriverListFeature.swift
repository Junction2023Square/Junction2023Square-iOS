import ComposableArchitecture
import DomainKit

import Foundation

public struct DriverListFeature: Reducer {
    public init() {
        
    }

    public struct State: Equatable {
        public var path = StackState<DriverDetailFeature.State>()

        public var driverItem: IdentifiedArrayOf<DriverItemEntity> = [
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 4.5, driverHistoryCount: 32, hashtags: ["맛집", "관광명소"], isFavorite: true),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 4.5, driverHistoryCount: 32, hashtags: ["맛집", "관광명소"], isFavorite: true),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 4.5, driverHistoryCount: 32, hashtags: ["맛집", "관광명소"], isFavorite: false),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 4.5, driverHistoryCount: 32, hashtags: ["맛집", "관광명소"], isFavorite: false),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 4.5, driverHistoryCount: 32, hashtags: ["맛집", "관광명소"], isFavorite: false)
        ]

        public var isSelctedFavoriteDriver: Bool = false

        public init() { }
    }

    public enum Action: Equatable {
        case didTapDriverListCell
        case path(StackAction<DriverDetailFeature.State, DriverDetailFeature.Action>)

        case didTapFavoriteDriver
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                state.path = .init()
                return .none

            case .didTapFavoriteDriver:
                state.isSelctedFavoriteDriver.toggle()
                return .none

            default:
                return .none
            }
        }
    }
}
