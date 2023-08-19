import ComposableArchitecture
import DomainKit

import Foundation

public struct DriverListFeature: Reducer {
    private let driverListUseCase: DriverListUseCaseProtocol
    
    public init(driverListUseCase: DriverListUseCaseProtocol) {
        self.driverListUseCase = driverListUseCase
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
        
        public var driverList: IdentifiedArrayOf<Driver> = []

        public var isSelctedFavoriteDriver: Bool = false

        public init() { }
    }

    public enum Action: Equatable {
        case didTapDriverListCell
        case path(StackAction<DriverDetailFeature.State, DriverDetailFeature.Action>)

        case didTapFavoriteDriver
        case fetchDriverList
        case fetchDriverListResponse([Driver])
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none

            case .didTapDriverListCell(let index):
                state.destination = .didTapDriverListCell(
                    DriverDetailFeature.State(
                        driverItem: state.driverList[index])
                )

                return .none

            case .destination(.presented(.didTapDriverListCell(.didTapReservationButton))):
                state.destination = .didTapReservationButton(.init())
                return .none

            case .destination(.presented(.didTapReservationButton(.didTapConfirmButton))):
                state.path = .init()
                return .none

            case .didTapFavoriteDriver:
                state.isSelctedFavoriteDriver.toggle()
                return .none
            case .fetchDriverList:
                return .run { send in
                    let drivers: [Driver] = try await driverListUseCase.getDrivers()
                    await send(.fetchDriverListResponse(drivers))
                }
            case .fetchDriverListResponse(let drivers):
                state.driverList = .init(uniqueElements: drivers)
                return .none
            default:
                return .none
            }
        }
    }
}
