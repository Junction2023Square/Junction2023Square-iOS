import ComposableArchitecture
import PresentationKit
import DomainKit
import DataKit

import SwiftUI

@main
struct JunctionTemplateApp: App {
    var body: some Scene {
        WindowGroup {
            DriverListView(store: .init(
                initialState: DriverListFeature.State(),
                reducer: {
                DriverListFeature(
                    driverListUseCase: DriverListUseCase(driverRepository: DriverRepository()))
            }))
        }
    }
}
