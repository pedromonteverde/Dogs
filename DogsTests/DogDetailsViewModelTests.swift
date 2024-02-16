//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import XCTest
import Combine
@testable import Dogs

final class DogDetailsViewModelTests: XCTestCase {

    var viewModel: DogDetailsViewModel?
    var cancellables = Set<AnyCancellable>()

    override func setUpWithError() throws {
        viewModel = DogDetailsViewModel(id: "", repository: MockRepository())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetch_givenFectchedValidID_retrieveDogDetails() throws {
        let expectation = expectation(description: "")

        viewModel?.fetch()

        viewModel?.$url.sink { [weak self] url in
            guard let self else { return }
            if let url {
                XCTAssertNil(viewModel?.error)
                expectation.fulfill()
            }
        }
        .store(in: &cancellables)

        waitForExpectations(timeout: 1)
    }
}
