import SwiftUI
import ComposableArchitecture

public struct DriverListView: View {
    public let store: StoreOf<DriverListFeature>

    public init(store: StoreOf<DriverListFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(self.store, observe: \.driverItem) { viewStore in
                ForEach(viewStore.state) { driverItem in
                    NavigationLink(state: DriverDetailFeature.State(driverItem: driverItem)) {
                        HStack {

                            Text(driverItem.name)

                            Spacer()

                            Button {

                            } label: {

                            }
                        }
                    }
                    .buttonStyle(.borderless)
                }
            }
        } destination: { store in
            DriverDetailView(store: store)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        DriverListView(store: .init(initialState: DriverListFeature.State(), reducer: {
            DriverListFeature()
        }))
    }
}
