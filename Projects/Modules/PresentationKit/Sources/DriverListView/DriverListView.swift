import ComposableArchitecture

import SwiftUI

public struct DriverListView: View {
    public let store: StoreOf<DriverListFeature>

    public init(store: StoreOf<DriverListFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(self.store, observe: \.driverItem) { viewStore in
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        HStack(alignment: .center) {
                            Text("Driver List")
                                .font(
                                    Font.custom("Gellix", size: 32)
                                        .weight(.bold)
                                )
                                .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))

                            Spacer()

                            HStack(alignment: .center, spacing: 0) {
                                Text("Favorite Driver")
                                    .font(
                                        Font.custom("Nexa Text-Trial", size: 13)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color(red: 0.31, green: 0.35, blue: 0.41))
                            .cornerRadius(20)

                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 0)
                        .frame(width: 380, alignment: .center)

                        ForEach(viewStore.state) { driverItem in
                            NavigationLink(state: DriverDetailFeature.State(driverItem: driverItem)) {
                                HStack(alignment: .top, spacing: 12) {
                                    ZStack {

                                    }
                                    .frame(width: 60, height: 60)
                                    .background(Color(red: 0.83, green: 0.85, blue: 0.88))
                                    .cornerRadius(8)

                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(alignment: .top) {
                                            Text("\(driverItem.name)")
                                                .font(
                                                    Font.custom("Gellix", size: 15)
                                                        .weight(.semibold)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))

                                            Spacer()

                                            Image(systemName: driverItem.isFavorite == true ? "heart.fill" : "heart")
                                                .resizable()
                                                .frame(width: 25, height: 20)
                                                .foregroundColor(Color.red)
                                                .onTapGesture {
                                                    viewStore.send(.didTapFavoriteDriver)
                                                }
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .top)

                                        HStack(alignment: .top, spacing: 8) {
                                            HStack(alignment: .center, spacing: 4) {
                                                PresentationKitAsset.starMono.swiftUIImage
                                                    .frame(width: 12, height: 12)

                                                Text("\(driverItem.ratingCount)")
                                                    .font(
                                                        Font.custom("Gellix", size: 13)
                                                            .weight(.semibold)
                                                    )
                                                    .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                            }

                                            HStack(alignment: .center, spacing: 4) {
                                                PresentationKitAsset.carMono.swiftUIImage
                                                    .frame(width: 12, height: 12)

                                                Text("\(driverItem.driverHistoryCount)")
                                                    .font(
                                                        Font.custom("Gellix", size: 13)
                                                            .weight(.semibold)
                                                    )
                                                    .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                            }
                                        }
                                        .padding(0)
                                        HStack {
                                            ForEach(1..<3) { _ in
                                                HStack(alignment: .top, spacing: 8) {
                                                    HStack(alignment: .center, spacing: 0) {
                                                        Text("Local Expertise")
                                                            .font(
                                                                Font.custom("Montserrat", size: 13)
                                                                    .weight(.semibold)
                                                            )
                                                            .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                                    }
                                                    .padding(.horizontal, 12)
                                                    .padding(.vertical, 4)
                                                    .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                                                    .cornerRadius(8)
                                                }
                                                .padding(0)

                                            }
                                            .padding(0)
                                        }
                                    }
                                }
                                .padding(0)
                                .frame(width: 335, alignment: .topLeading)
                            }
                            .buttonStyle(.borderless)
                        }
                        .padding(.leading, 20)

                        Spacer()
                    }
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
