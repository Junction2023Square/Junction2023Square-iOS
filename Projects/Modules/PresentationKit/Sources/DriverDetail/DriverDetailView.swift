//
//  DriverDetailView.swift
//  PresentationKit
//
//  Created by 고병학 on 2023/08/19.
//  Copyright © 2023 kr.junction.square. All rights reserved.
//

import ComposableArchitecture
import DomainKit
import SwiftUI

public struct DriverDetailView: View {
    public init(store: StoreOf<DriverDetailFeature>) {
        self.store = store
    }
    
    public let store: StoreOf<DriverDetailFeature>
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("Driver Detail")
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
