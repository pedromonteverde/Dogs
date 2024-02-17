//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import XCTest
@testable import Dogs

final class DogsUITests: XCTestCase {

    let app = XCUIApplication()

    let existenceTimeout: Double = 5

    override func setUpWithError() throws {
        app.launchArguments.append("USE_MOCK_SERVER")
        continueAfterFailure = false
    }

    func testHomeScreenLaunch_wait_fetch10Images() throws {
        app.launch()

        let text = app.staticTexts["amount"]
        _ = text.waitForExistence(timeout: existenceTimeout)

        XCTAssertEqual(text.label, "10")
    }

    func testHomeScreenLaunch_scrollDown_fetch20Images() throws {
        app.launch()

        let list = app.collectionViews["list"]
        _ = list.waitForExistence(timeout: existenceTimeout)

        app.swipeUp()

        let text = app.staticTexts["amount"]
        _ = text.waitForExistence(timeout: existenceTimeout)

        XCTAssertEqual(text.label, "20")
    }

    func testHomeScreenLaunch_toDetailsScreen_navigation() throws {
        app.launch()

        let button = app.buttons["cell"].firstMatch
        _ = button.waitForExistence(timeout: existenceTimeout)
        button.tap()

        let view = app.images["details"].firstMatch
        _ = view.waitForExistence(timeout: existenceTimeout)
    }
}
