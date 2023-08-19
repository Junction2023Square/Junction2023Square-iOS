//
//  DriverDetailView.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/08/19.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import ComposableArchitecture
import DomainKit
import SwiftUIFlowLayout

import SwiftUI

public struct DriverDetailView: View {
    private enum Constants {
        static let Corner3: CGFloat = 8
        static let Margin: CGFloat = 20
        static let Corner: CGFloat = 12
    }
    
    public init(store: StoreOf<DriverDetailFeature>) {
        self.store = store
    }
    
    public let store: StoreOf<DriverDetailFeature>
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                ScrollView {
                    HStack(alignment: .top, spacing: 16) {
                        Rectangle()
                            .fill(Color(red: 0.83, green: 0.85, blue: 0.88))
                            .frame(width: 80, height: 80)
                            .cornerRadius(Constants.Corner3)
                        
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(viewStore.driver.name)
                                    .font(
                                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 24)
                                    )
                                    .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                HStack(alignment: .center) {
                                    PresentationKitAsset.starMono.swiftUIImage
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text("\(String(format: "%.1f", viewStore.reviewAverage))")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 16)
                                        )
                                        .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                        .padding(.trailing, 8)
                                    
                                    PresentationKitAsset.carMono.swiftUIImage
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    
                                    Text("\(viewStore.reviews.count)")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 16)
                                        )
                                        .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                }
                                .padding(0)
                            }
                            .padding(0)
                            Spacer()
                            Button {
                                viewStore.send(.didTapFavoriteButton)
                            } label: {
                                if viewStore.state.isSelectedFavorite == true {
                                    PresentationKitAsset.heartPink.swiftUIImage
                                        .frame(width: 20, height: 20)
                                } else {
                                    PresentationKitAsset.heartMono.swiftUIImage
                                        .frame(width: 20, height: 20)
                                }
                            }
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(.horizontal, Constants.Margin)
                    .padding(.vertical, 0)
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                    .padding(.bottom, 28)
                    .onAppear {
                        viewStore.send(.fetchDriverReview)
                    }
                    
                    // 드라이버, 리뷰 탭
                    HStack(alignment: .top, spacing: 0) {
                        Button {
                            viewStore.send(.didTapDriverInfo)
                        } label: {
                            ZStack {
                                HStack(alignment: .center, spacing: 4) {
                                    Text("Driver")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 18)
                                        )
                                        .foregroundColor(viewStore.selectedIndex == 0 ? Color(red: 0.1, green: 0.12, blue: 0.16) : Color(red: 0.68, green: 0.72, blue: 0.78))

                                }
                                .padding(.horizontal, 4)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .fill(viewStore.selectedIndex == 0 ? Color(red: 0.34, green: 0.62, blue: 0.95) : Color(red: 0.83, green: 0.85, blue: 0.88))
                                        .frame(maxWidth: .infinity, maxHeight: 2)
                                }
                            }
                        }
                        
                        Button {
                            viewStore.send(.didTapReviewInfo)
                        } label: {
                            ZStack {
                                HStack(alignment: .center, spacing: 4) {
                                    Text("Review")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 18)
                                        )
                                        .foregroundColor(viewStore.selectedIndex == 0 ? Color(red: 0.68, green: 0.72, blue: 0.78) : Color(red: 0.1, green: 0.12, blue: 0.16))
                                }
                                .padding(.horizontal, 4)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .fill(viewStore.selectedIndex == 0 ? Color(red: 0.83, green: 0.85, blue: 0.88) : Color(red: 0.34, green: 0.62, blue: 0.95))
                                        .frame(maxWidth: .infinity, maxHeight: 2)
                                }
                            }
                        }
                    }
                    .padding(0)
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                    .padding(.bottom, 28)
                    
                    // 택시기사 상세 정보
                    if viewStore.state.selectedIndex == 0 {
                        Group {
                            VStack(alignment: .center, spacing: 28) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Information")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 16)
                                        )
                                        .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))

                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack(alignment: .top) {
                                            Text("Car")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                                )
                                                .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                            Spacer()
                                            Text("Mid-size sedan")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .top)
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)

                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack(alignment: .top) {
                                            Text("Service Area")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                                )
                                                .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                            Spacer()
                                            Text("All over Busan")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .top)
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(.horizontal, Constants.Margin)
                                .padding(.vertical, 0)
                                .frame(width: 375, alignment: .topLeading)
                            }
                            .padding(0)

                            Rectangle()
                                .fill(Color(red: 0.96, green: 0.97, blue: 0.98))
                                .frame(width: UIScreen.main.bounds.width, height: 6)
                                .padding([.top, .bottom], 28)

                            VStack(alignment: .leading, spacing: 24) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Introduction")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                        )
                                        .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                                    Text("Greetings! I'm [Your Name], your friendly and experienced taxi driver. With years of navigating the streets of [Your City], I'm not just here to drive – I'm here to guide you through the pulse of our city. Whether you're seeking local insights, a smooth ride, or a friendly conversation, I'm dedicated to making your journey safe, enjoyable, and memorable. Sit back, relax, and let's explore [Your City] together!")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                        )
                                        .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                        .frame(width: 335, alignment: .top)
                                }
                                .padding(0)
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.vertical, 0)

                            FlowLayout(
                                mode: .scrollable,
                                items: ["🍃  Local Expertise", "🚘 Safe Driver", "👋 Friendly and Approachable"],
                                itemSpacing: 4
                            ) { item in
                                HStack(alignment: .center, spacing: 0) {
                                    Text(item)
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                                        )
                                        .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color(red: 0.96, green: 0.97, blue: 0.98))
                                .cornerRadius(Constants.Corner3)
                            }.padding()

                            Rectangle()
                                .fill(Color(red: 0.96, green: 0.97, blue: 0.98))
                                .frame(width: UIScreen.main.bounds.width, height: 6)
                                .padding([.top, .bottom], 28)

                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("News")
                                        .font(
                                            PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                                        )
                                        .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, Constants.Margin)
                            .padding(.top, 0)
                            .frame(width: UIScreen.main.bounds.width)

                            VStack(alignment: .leading) {
                                getNewsCell()
                                getNewsCell()
                                getNewsCell()
                                getNewsCell()
                            }
                            .padding(.bottom, 120)
                        }

                    } else {
                        Group {
                            VStack(alignment: .leading, spacing: 28) {
                                VStack(alignment: .leading, spacing: 16) {
                                    HStack(alignment: .center) {
                                        HStack(alignment: .center, spacing: 4) {
                                            PresentationKitAsset.starMono.swiftUIImage
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                            Text("\(viewStore.reviews.map({ $0.rating }).reduce(0, { $0 + $1})/viewStore.reviews.count)")
                                                .font(
                                                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 26)
                                                )
                                                .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                        }
                                        .padding(0)

                                        Spacer()

                                        Text("\(viewStore.reviews.count) reviews")
                                            .font(
                                                PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 16)
                                            )
                                            .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                                    }
                                    .padding(.horizontal, Constants.Margin)
                                    .padding(.vertical, 0)

                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(alignment: .top, spacing: 8) {
                                            ForEach(["Cafe", "Clean", "Price", "Safe", "Fast"], id: \.self) { (title: String) in
                                                getChip(title: title)
                                            }
                                        }
                                        .padding(.leading, Constants.Margin)
                                        .padding(.trailing, 0)
                                        .padding(.vertical, 0)
                                    }
                                }
                                .padding(0)

                                ForEach(viewStore.reviews, id: \.self) { (driverReview: DriverReview) in
                                    getReviewCell(
                                        title: driverReview.title,
                                        content: driverReview.content,
                                        rating: driverReview.rating
                                    )
                                }
                            }
                            .padding(0)
                            .padding(.bottom, 120)
                        }
                    }

                } // ScrollView
                
                VStack {
                    Spacer()

                    NavigationLink(state: DriverListFeature.Path.State.driverPickUp()) {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Reserve")
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
    
    private func getReviewCell(title: String, content: String, rating: Int) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(
                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 18)
                    )
                    .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                Text("Jihan Park")
                    .font(
                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                    )
                    .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
            }
            .padding(0)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 4) {
                    ForEach(0..<rating, id: \.self) { _ in
                        PresentationKitAsset.starMono.swiftUIImage
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                }
                .padding(0)
                Text(content)
                    .font(
                        PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                    )
                    .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                    .frame(maxWidth: .infinity)
            }
            .padding(0)
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, Constants.Margin)
        .padding(.vertical, 0)
        .frame(maxWidth: .infinity)
    }
    
    private func getChip(title: String) -> some View {
        HStack(alignment: .center, spacing: 4) {
            Text(title)
                .font(
                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                )
                .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
            Text("\((2...30).randomElement() ?? 1)")
                .font(
                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 15)
                )
                .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color(red: 0.96, green: 0.97, blue: 0.98))
        .cornerRadius(Constants.Corner3)
    }
    
    private func getNewsCell() -> some View {
        Group {
            Rectangle()
                .fill(Color(red: 0.83, green: 0.85, blue: 0.88))
                .frame(width: UIScreen.main.bounds.width - 40, height: 140)
                .cornerRadius(Constants.Corner3)
                .padding(.bottom, 16)
                .padding(.horizontal, 20)
            
            Text("Experience Summer by the Sea with Our Taxi Tour!")
                .font(
                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                )
                .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
            
            Text("Explore coastal magic on our 4-hour tour: catch sunrise at [Sunrise Point], savor beachfront brunch, cruise coastal cliffs, discover [Hidden Cove], and capture lighthouse views. Optional watersports available. Book now for an unforgettable seaside escape!")
                .font(
                    PresentationKitFontFamily.CircularStd.medium.swiftUIFont(size: 13)
                )
                .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                .frame(width: UIScreen.main.bounds.width - 40, alignment: .top)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
        }
    }
}

struct DriverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailView(store: Store(
            initialState: DriverDetailFeature.State(driver: .init(
                driverID: UUID().uuidString,
                name: "Test Driver",
                drives: 300,
                averageRating: "5",
                region: "Korea",
                carSize: .large,
                profileImgURL: "",
                createdAt: "\(Date())",
                updatedAt: "\(Date())"
            )),
            reducer: {
                DriverDetailFeature()
            }
        ))
    }
}
