//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import XCTest
@testable import Dogs

final class RepositoryTests: XCTestCase {

    var repository: Repository?

    override func setUpWithError() throws {
        repository = DefaultRepository()
    }

    override func tearDownWithError() throws {
        repository = nil
    }

    func testFecthDogImages_givenInvalidURL_throwError() async throws {
        let invalidURL = try XCTUnwrap(URL(string: "invalid"))
        do {
            _ = try await repository?.fetchDogImages(from: invalidURL)
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testFecthDogImages_givenInvalidCodables_throwError() async throws {
        let bundle = Bundle(for: Self.self)
        let url = try XCTUnwrap(bundle.url(forResource: "InvalidDogImages", withExtension: "json"))
        do {
            _ = try await repository?.fetchDogImages(from: url)
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testFecthDogImages_givenValidRequest_retrieveDogImages() async throws {
        let bundle = Bundle(for: Self.self)
        let url = try XCTUnwrap(bundle.url(forResource: "DogImages", withExtension: "json"))
        do {
            let dogImages = try await repository?.fetchDogImages(from: url)
            XCTAssertEqual(dogImages?.count, 10)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testFecthDogDetails_givenInvalidURL_throwError() async throws {
        let invalidURL = try XCTUnwrap(URL(string: "invalid"))
        do {
            _ = try await repository?.fetchDogDetails(from: invalidURL)
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testFecthDogDetails_givenInvalidCodable_throwError() async throws {
        let bundle = Bundle(for: Self.self)
        let url = try XCTUnwrap(bundle.url(forResource: "InvalidDogDetails", withExtension: "json"))
        do {
            _ = try await repository?.fetchDogDetails(from: url)
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testFecthDogDetails_givenValidRequest_retrieveDogDetails() async throws {
        let bundle = Bundle(for: Self.self)
        let url = try XCTUnwrap(bundle.url(forResource: "DogDetails", withExtension: "json"))
        do {
            let dogDetails = try await repository?.fetchDogDetails(from: url)
            XCTAssertNotNil(dogDetails)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
