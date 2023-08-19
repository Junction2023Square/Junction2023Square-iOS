import SwiftUI
import ComposableArchitecture

public struct DriverPickUpView: View {
    public let store: StoreOf<DriverPickUpFeature>

    public init(store: StoreOf<DriverPickUpFeature>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in

        }
    }
}

struct PickUpDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverPickUpView(store: .init(initialState: DriverPickUpFeature.State(), reducer: {
            DriverPickUpFeature()
        }))
    }
}
