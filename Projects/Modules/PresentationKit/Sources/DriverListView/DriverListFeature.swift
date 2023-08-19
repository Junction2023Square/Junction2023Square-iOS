import Foundation
import ComposableArchitecture
import DomainKit

public struct DriverListFeature: Reducer {
    public init() {
        
    }

    public struct State: Equatable {
        var path = StackState<DriverDetailFeature.State>()

        var driverItem: IdentifiedArrayOf<DriverItemEntity> = [
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 121, driverHistoryCount: 32, hashtag: ["맛집", "관광명소"]),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 121, driverHistoryCount: 32, hashtag: ["맛집", "관광명소"]),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 121, driverHistoryCount: 32, hashtag: ["맛집", "관광명소"]),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 121, driverHistoryCount: 32, hashtag: ["맛집", "관광명소"]),
            .init(id: UUID(), name: "김 으무", driverImageURL: "dd", ratingCount: 121, driverHistoryCount: 32, hashtag: ["맛집", "관광명소"])
        ]
        public init() { }
    }

    public enum Action: Equatable {
        case didTapDriverDetail(index: Int)
        case path(StackAction<DriverDetailFeature.State, DriverDetailFeature.Action>)

    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
              return .none

            default:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            DriverDetailFeature()
         }
    }
}
