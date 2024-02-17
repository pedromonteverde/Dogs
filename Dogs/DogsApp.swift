//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

@main
struct DogsApp: App {
    var body: some Scene {
        WindowGroup {
            SceneLauncher()
        }
    }
}

struct SceneLauncher: View {

    let isNotUnitTesting = NSClassFromString("XCTestCase") == nil
    let isUITesting = ProcessInfo.processInfo.arguments.contains("USE_MOCK_SERVER")

    var body: some View {
        if isNotUnitTesting {
            if isUITesting {
                HomeView(viewModel: HomeViewModel(repository: MockRepository()))
            } else {
                HomeView(viewModel: HomeViewModel(repository: DefaultRepository()))
            }
        }
    }
}
