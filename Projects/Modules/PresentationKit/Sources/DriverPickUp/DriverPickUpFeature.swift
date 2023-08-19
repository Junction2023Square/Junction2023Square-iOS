import ComposableArchitecture
import DomainKit

import Foundation

public struct DriverPickUpFeature: Reducer {
    public init() {

    }

    public struct State: Equatable {
        public init() { }
        
        @BindingState public var pickUpLocationText: String = ""
        @BindingState public var arriveLocationText: String = ""
        
        @BindingState public var pickUpDate: Date = Date()
        @BindingState public var arriveDate: Date = Date()
    }

    public enum Action: Equatable {
        case didChangePickUpLocationText(String)
        case didChangeArriveLocationText(String)
        case didChangePickUpDate(Date)
        case didChangeArriveDate(Date)
        case didTapConfirmButton
    }

    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didChangePickUpLocationText(let locationText):
                  state.pickUpLocationText = locationText
                  return .none
            case .didChangeArriveLocationText(let locationText):
                  state.arriveLocationText = locationText
                  return .none
            case .didChangePickUpDate(let date):
                state.pickUpDate = date
                return .none
            case .didChangeArriveDate(let date):
                state.arriveDate = date
                return .none
            default:
                return .none
            }
        }
    }
}
