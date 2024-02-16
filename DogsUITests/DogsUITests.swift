//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import XCTest

final class DogsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testHomeScreenLaunch_toDetailsScreen_navigation() throws {
        let app = XCUIApplication()
        app.launchArguments.append("USE_MOCK_SERVER")
        app.launch()

        let button = app.buttons["cell"].firstMatch
        _ = button.waitForExistence(timeout: 5)
        button.tap()

        let view = app.images["details"].firstMatch
        _ = view.waitForExistence(timeout: 5)
    }
}
