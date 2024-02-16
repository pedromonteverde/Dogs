//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import XCTest
import Combine
@testable import Dogs

final class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        viewModel = HomeViewModel(repository: MockRepository())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchMore_givenFectchedOnce_retrieve10Images() throws {
        let expectation = expectation(description: "")

        viewModel?.fetchMore()
        XCTAssertEqual(viewModel?.fetching, true)

        viewModel?.$fetching.sink { [weak self] fetching in
            guard let self else { return }
            if !fetching {
                XCTAssertNil(viewModel?.error)
                XCTAssertEqual(viewModel?.images.count, 10)
                XCTAssertEqual(viewModel?.page, 1)
                expectation.fulfill()
            }
        }
        .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }

    func testFetchMore_givenFectchedTwice_retrieve20Images() throws {
        let expectation = expectation(description: "")

        viewModel?.fetchMore()
        viewModel?.fetchMore()

        XCTAssertEqual(viewModel?.fetching, true)

        viewModel?.$images.sink { [weak self] images in
            guard let self else { return }
            if images.count > 10 {
                XCTAssertNil(viewModel?.error)
                XCTAssertEqual(images.count, 20)
                XCTAssertEqual(viewModel?.page, 2)
                expectation.fulfill()
            }
        }
        .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }

    func testFetchMore_givenFectchedBad_throwError() throws {
        let expectation = expectation(description: "")

        viewModel?.fetchMore()
        XCTAssertEqual(viewModel?.fetching, true)

        viewModel?.$fetching.sink { [weak self] fetching in
            guard let self else { return }
            if !fetching {
                XCTAssertEqual(viewModel?.images.count, 10)
                XCTAssertEqual(viewModel?.page, 1)
                expectation.fulfill()
            }
        }
        .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }
}
