import SwiftUI
import ComposableArchitecture

public struct ReservationConfirmView: View {
    public let store: StoreOf<ReservationConfirmFeature>

    public init(store: StoreOf<ReservationConfirmFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text("여기")
        }
    }
}

struct ReservationConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationConfirmView(store: .init(initialState: ReservationConfirmFeature.State(), reducer: {
            ReservationConfirmFeature()
        }))
    }
}
