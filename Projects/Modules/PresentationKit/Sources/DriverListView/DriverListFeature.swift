import ComposableArchitecture
import DomainKit

import Foundation

public struct DriverListFeature: Reducer {
    private let driverListUseCase: DriverListUseCaseProtocol
    
    public init(driverListUseCase: DriverListUseCaseProtocol) {
        self.driverListUseCase = driverListUseCase
    }

    public struct State: Equatable {
        public var path = StackState<Path.State>()

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
        case path(StackAction<Path.State, Path.Action>)

        case didTapFavoriteDriver
        case fetchDriverList
        case fetchDriverListResponse([Driver])
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .path(action):
                switch action {
                case .element(id: _, action: .driverDetail):
//                    state.path.append(.driverDetail(.init(driver: driver)))
                    return .none

                case .element(id: _, action: .driverPickUp):
                    state.path.append(.driverPickUp())
                    return .none

                case .element(id: _, action: .reservationConfirm):
                    state.path.append(.reservationConfirm())
                    return .none

                default:
                    return .none
                }
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
        .forEach(\.path, action: /Action.path) {
            Path()
        }
    }

    public struct Path: Reducer {
        public enum State: Equatable {
            case driverDetail(DriverDetailFeature.State)
            case driverPickUp(DriverPickUpFeature.State = .init())
            case reservationConfirm(ReservationConfirmFeature.State = .init())
        }

        public enum Action: Equatable {
            case driverDetail(DriverDetailFeature.Action)
            case driverPickUp(DriverPickUpFeature.Action)
            case reservationConfirm(ReservationConfirmFeature.Action)
        }

        public var body: some Reducer<State, Action> {
            Scope(state: /State.driverDetail, action: /Action.driverDetail) {
                DriverDetailFeature()
            }

            Scope(state: /State.driverPickUp, action: /Action.driverPickUp) {
                DriverPickUpFeature()
            }

            Scope(state: /State.reservationConfirm, action: /Action.reservationConfirm) {
                ReservationConfirmFeature()
            }
        }
    }
}
