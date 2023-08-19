import ComposableArchitecture
import DomainKit
import Kingfisher

import SwiftUI

public struct DriverListView: View {
    public let store: StoreOf<DriverListFeature>

    public init(store: StoreOf<DriverListFeature>) {
        self.store = store
    }

    public var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(self.store, observe: \.driverList) { viewStore in
                ScrollView {
                    VStack(alignment: .leading, spacing: 32) {
                        HStack(alignment: .center) {
                            Text("Driver List")
                                .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 32)
                                )
                                .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))

                            Spacer()

                            HStack(alignment: .center, spacing: 0) {
                                Text("Favorite Driver")
                                    .font(
                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
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

                        ForEach(viewStore.state) { (driver: Driver) in
                            NavigationLink(state: DriverListFeature.Path.State.driverDetail(.init(driver: driver))) {
                                HStack(alignment: .top, spacing: 12) {
                                    ZStack {
                                        KFImage(URL(string: driver.profileImgURL))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                    }
                                    .frame(width: 60, height: 60)
                                    .background(Color(red: 0.83, green: 0.85, blue: 0.88))
                                    .cornerRadius(8)
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(alignment: .top) {
                                            Text("\(driver.name)")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))

                                            Spacer()

                                            Image(systemName: (Double(driver.averageRating) ?? 0) > 3 ? "heart.fill" : "heart")
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

                                                Text("\((1...5).randomElement() ?? 1).0")
                                                    .font(
                                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                                    )
                                                    .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                            }

                                            HStack(alignment: .center, spacing: 4) {
                                                PresentationKitAsset.carMono.swiftUIImage
                                                    .frame(width: 12, height: 12)

                                                Text("\((1...1000).randomElement() ?? 0)")
                                                    .font(
                                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
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
                                                                PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
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
                .onAppear {
                    viewStore.send(.fetchDriverList)
                }
            }
        } destination: {
            switch $0 {
            case .driverDetail:
                CaseLet(
                    /DriverListFeature.Path.State.driverDetail,
                     action: DriverListFeature.Path.Action.driverDetail,
                     then: DriverDetailView.init(store:)
                )

            case .driverPickUp:
                CaseLet(
                    /DriverListFeature.Path.State.driverPickUp,
                     action: DriverListFeature.Path.Action.driverPickUp,
                     then: DriverPickUpView.init(store:)
                )

            case .reservationConfirm:
                CaseLet(
                    /DriverListFeature.Path.State.reservationConfirm,
                     action: DriverListFeature.Path.Action.reservationConfirm,
                     then: ReservationConfirmView.init(store:)
                )

            default:
                EmptyView()
            }
        }
    }
}
