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
                        
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 12) {
                                // Head2
                                Text("Sangjin Lee")
                                    .font(
                                        Font.custom("Circular Std", size: 26)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                HStack(alignment: .top, spacing: 8) {
                                    Text("4.8")
                                        .font(
                                            Font.custom("Circular Std", size: 15)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                    Text("352")
                                        .font(
                                            Font.custom("Circular Std", size: 15)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.31, green: 0.35, blue: 0.41))
                                }
                                .padding(0)
                            }
                            .padding(0)
                            Spacer()
                            Image("icon-heart-mono")
                                .frame(width: 20, height: 20)
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .top)
                    }
                    .padding(.horizontal, Constants.Margin)
                    .padding(.vertical, 0)
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                    .padding(.bottom, 28)
                    
                    // 드라이버, 리뷰 탭
                    HStack(alignment: .top, spacing: 0) {
                        Button {
                            print("Driver")
                        } label: {
                            ZStack {
                                HStack(alignment: .center, spacing: 4) {
                                    Text("Driver")
                                        .font(
                                            Font.custom("Circular Std", size: 17)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                                }
                                .padding(.horizontal, 4)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .fill(Color(red: 0.34, green: 0.62, blue: 0.95))
                                        .frame(width: .infinity, height: 2)
                                }
                            }
                        }
                        Button {
                            print("Review")
                        } label: {
                            ZStack {
                                HStack(alignment: .center, spacing: 4) {
                                    // Body1
                                    Text("Review")
                                        .font(
                                            Font.custom("Circular Std", size: 17)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.68, green: 0.72, blue: 0.78))
                                }
                                .padding(.horizontal, 4)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .center)
                                
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .fill(Color(red: 0.83, green: 0.85, blue: 0.88))
                                        .frame(width: .infinity, height: 2)
                                }
                            }
                        }
                    }
                    .padding(0)
                    .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
                    .padding(.bottom, 28)
                    
                    VStack(alignment: .center, spacing: 28) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Information")
                                .font(
                                    Font.custom("Circular Std", size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(alignment: .top) {
                                    Text("Car")
                                        .font(
                                            Font.custom("Circular Std", size: 13)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                    Spacer()
                                    Text("Mid-size sedan")
                                        .font(
                                            Font.custom("Circular Std", size: 13)
                                                .weight(.semibold)
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
                                            Font.custom("Circular Std", size: 13)
                                                .weight(.semibold)
                                        )
                                        .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                                    Spacer()
                                    Text("All over Busan")
                                        .font(
                                            Font.custom("Circular Std", size: 13)
                                                .weight(.semibold)
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
                                    Font.custom("Circular Std", size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                            Text("Greetings! I'm [Your Name], your friendly and experienced taxi driver. With years of navigating the streets of [Your City], I'm not just here to drive – I'm here to guide you through the pulse of our city. Whether you're seeking local insights, a smooth ride, or a friendly conversation, I'm dedicated to making your journey safe, enjoyable, and memorable. Sit back, relax, and let's explore [Your City] together!")
                                .font(
                                    Font.custom("Circular Std", size: 13)
                                        .weight(.semibold)
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
                                    Font.custom("Circular Std", size: 13)
                                        .weight(.semibold)
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
                                    Font.custom("Circular Std", size: 15)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                            Spacer()
                        }
                        
                    }
                    .padding(.horizontal, Constants.Margin)
                    .padding(.top, 0)
                    .frame(width: UIScreen.main.bounds.width)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color(red: 0.83, green: 0.85, blue: 0.88))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 140)
                            .cornerRadius(Constants.Corner3)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 20)
                        
                        Text("Experience Summer by the Sea with Our Taxi Tour!")
                            .font(
                                Font.custom("Circular Std", size: 13)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                            .padding(.horizontal, 20)
                            .padding(.bottom, 8)
                        
                        Text("Explore coastal magic on our 4-hour tour: catch sunrise at [Sunrise Point], savor beachfront brunch, cruise coastal cliffs, discover [Hidden Cove], and capture lighthouse views. Optional watersports available. Book now for an unforgettable seaside escape!")
                            .font(
                                Font.custom("Circular Std", size: 13)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                            .frame(width: .infinity, alignment: .top)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        
                        Rectangle()
                            .fill(Color(red: 0.83, green: 0.85, blue: 0.88))
                            .frame(width: UIScreen.main.bounds.width - 40, height: 140)
                            .cornerRadius(Constants.Corner3)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 20)
                        
                        Text("Experience Summer by the Sea with Our Taxi Tour!")
                            .font(
                                Font.custom("Circular Std", size: 13)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.1, green: 0.12, blue: 0.16))
                            .padding(.horizontal, 20)
                            .padding(.bottom, 8)
                        
                        Text("Explore coastal magic on our 4-hour tour: catch sunrise at [Sunrise Point], savor beachfront brunch, cruise coastal cliffs, discover [Hidden Cove], and capture lighthouse views. Optional watersports available. Book now for an unforgettable seaside escape!")
                            .font(
                                Font.custom("Circular Std", size: 13)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.47, green: 0.52, blue: 0.59))
                            .frame(width: .infinity, alignment: .top)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                    }
                    .padding(.bottom, 120)
                }
                
                VStack {
                    Spacer()
                    Button {
                        print("Bottom action")
                    } label: {
                        HStack(alignment: .center, spacing: 0) {
                            Text("Reserve")
                                .font(
                                    Font.custom("Circular Std", size: 16)
                                        .weight(.bold)
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
                    .frame(width: .infinity)
                    .background(Color.white)
                }
            }
        }
    }
}

struct DriverDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DriverDetailView(store: Store(
            initialState: DriverDetailFeature.State(
                driverItem: DriverItemEntity(
                    id: UUID(),
                    name: "김 으무",
                    driverImageURL: "dd",
                    ratingCount: 121,
                    driverHistoryCount: 32,
                    hashtags: ["맛집", "관광명소"],
                    isFavorite: true)),
            reducer: {
                DriverDetailFeature()
            }
        ))
    }
}
