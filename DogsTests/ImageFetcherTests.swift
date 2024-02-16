//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import XCTest
import SwiftUI
@testable import Dogs

final class ImageFetcherTests: XCTestCase {

    var imageFetcher: ImageFetcher?

    override func setUpWithError() throws {
        imageFetcher = ImageFetcher()
    }

    override func tearDownWithError() throws {
        imageFetcher = nil
    }

    func testImageFetcher_givenValidImages_fetchSuccessfully() async throws {
        let bundle = Bundle(for: Self.self)

        let urls = try Tests.images.map { image in
            try XCTUnwrap(bundle.url(forResource: image.key, withExtension: image.value))
        }

        let images = try await urls.asyncCompactMap {
            try await imageFetcher?.get(from: $0)
        }

        XCTAssertEqual(images.count, 10)
    }

    func testImageFetcher_givenRepeatedValidImages_retrieveTheCorrectCachedAmount() async throws {
        let bundle = Bundle(for: Self.self)

        let urls = try Tests.images.map { image in
            try XCTUnwrap(bundle.url(forResource: image.key, withExtension: image.value))
        }

        let repeatedURLs = urls + urls

        let images = try await repeatedURLs.asyncCompactMap {
            try await imageFetcher?.get(from: $0)
        }

        let cached = await imageFetcher?.cached

        XCTAssertEqual(images.count, 20)
        XCTAssertEqual(cached?.count, 10)
    }

    func testImageFetcher_givenInvalidURL_throwError() async throws {
        let url = try XCTUnwrap(URL(string: "invalid"))

        do {
            _ = try await imageFetcher?.get(from: url)
            XCTFail()
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testImageFetcher_givenInvalidImage_retrievesNil() async throws {
        let bundle = Bundle(for: Self.self)

        let url = try XCTUnwrap(bundle.url(forResource: "DogImages", withExtension: "json"))

            let image = try await imageFetcher?.get(from: url)
            XCTAssertEqual(image, nil)
    }
}

extension ImageFetcherTests {
    enum Tests {
        static let images = [
            "5TKMTrS09": "jpg",
            "9POof5zD0": "jpg",
            "38KoA9gGB": "jpg",
            "Bk-WET6Em": "gif",
            "S1V3Qeq4X_1280": "jpg",
            "Sk67KO2rX_1280": "jpg",
            "SkRpsgc47_1280": "jpg",
            "SyNNYd3S7_1280": "jpg",
            "wPIaaiYOy": "jpg",
            "xmHTSrAon_1280": "jpg"
        ]
    }
}

extension Sequence {
    func asyncCompactMap<T>(
        _ transform: (Element) async throws -> T?
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            if let result = try await transform(element) {
                values.append(result)
            }
        }

        return values
    }
}
