import ComposableArchitecture

import SwiftUI

public struct ReservationConfirmView: View {
    private enum Constants {
        static let Margin: CGFloat = 20
        static let Corner: CGFloat = 12
    }
    
    public let store: StoreOf<ReservationConfirmFeature>
    
    public init(store: StoreOf<ReservationConfirmFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                ScrollView {
                    VStack(alignment: .center, spacing: 36) {
                        PresentationKitAsset.confirmIcon
                            .swiftUIImage
                            .resizable()
                            .foregroundColor(.clear)
                            .frame(width: 140, height: 140)
                        
                        VStack(alignment: .leading, spacing: 60) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("You’re\nconfirmed!")
                                    .font(
                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 32)
                                    )
                                    .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                                
                                Text("The driver will contact you for details")
                                    .font(
                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                    )
                                    .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.vertical, 0)
                            .frame(width: 375, alignment: .topLeading)
                            
                            VStack(alignment: .leading, spacing: 32) {
                                HStack(alignment: .center) {
                                    // Space Between
                                    VStack(alignment: .leading, spacing: 12) {
                                        // Body2
                                        Text("Pick-up")
                                            .font(
                                                PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                            )
                                            .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            // Body2
                                            Text("Wed, May 23,\n2:00 PM")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                            
                                            // Body2
                                            Text("Busan Station")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                        }
                                        .padding(0)
                                    }
                                    .padding(0)
                                    Spacer()
                                    
                                    PresentationKitAsset.arrowRight
                                        .swiftUIImage
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 12) {
                                        Text("Arrival")
                                            .font(
                                                PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                            )
                                            .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                                        
                                        VStack(alignment: .trailing, spacing: 8) {
                                            // Body2
                                            Text("Fri, May 25,\n6:00 PM")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                                )
                                                .multilineTextAlignment(.trailing)
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                            
                                            // Body2
                                            Text("Busan Station")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                        }
                                        .padding(0)
                                    }
                                    .padding(0)
                                       
                                }
                                .padding(.horizontal, Constants.Margin)
                                .padding(.vertical, 0)
                                .frame(width: 375, alignment: .center)
                                
                                HStack(alignment: .top) {
                                    Text("Driver")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                        )
                                        .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                                    Spacer()
                                    Text("Hojin Lee")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                        )
                                        .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                }
                                .padding(.horizontal, Constants.Margin)
                                .padding(.vertical, 0)
                                .frame(width: 375, alignment: .top)
                            }
                            .padding(0)
                        }
                        .padding(0)
                    }
                    .padding(.horizontal, 0)
                    .padding(.vertical, 60)
                }
                
                VStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Confirm")
                                .font(
                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 16)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                        .background(Color(red: 0.34, green: 0.62, blue: 0.95))
                        .cornerRadius(Constants.Corner)
                    }
                    .padding(.top, 12)
                    .padding([.leading, .trailing], 20)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color.white)
                }
            }
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
