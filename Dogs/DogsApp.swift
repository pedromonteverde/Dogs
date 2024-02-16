//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

@main
struct DogsApp: App {
    var body: some Scene {
        WindowGroup {
            if NSClassFromString("XCTestCase") != nil {
                HomeView(viewModel: HomeViewModel(repository: MockRepository()))
            } else {
                if ProcessInfo.processInfo.arguments.contains("USE_MOCK_SERVER") {
                    HomeView(viewModel: HomeViewModel(repository: MockRepository()))
                } else {
                    HomeView(viewModel: HomeViewModel(repository: DefaultRepository()))
                }
            }
        }
    }
}
