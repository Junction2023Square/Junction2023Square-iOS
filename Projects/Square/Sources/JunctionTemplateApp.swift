import ComposableArchitecture
import PresentationKit

import SwiftUI

@main
struct JunctionTemplateApp: App {
    var body: some Scene {
        WindowGroup {
            OrderView(store: .init(initialState: OrderFeature.State(), reducer: {
                OrderFeature()
            }))
        }
    }
}
