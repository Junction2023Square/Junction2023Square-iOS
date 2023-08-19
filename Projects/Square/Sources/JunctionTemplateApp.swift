import ComposableArchitecture
import PresentationKit

import SwiftUI

@main
struct JunctionTemplateApp: App {
    var body: some Scene {
        WindowGroup {
            DriverListView(store: .init(
                initialState: DriverListFeature.State(),
                reducer: {
                DriverListFeature()
            }))
        }
    }
}
