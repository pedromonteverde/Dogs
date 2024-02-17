//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import Foundation

class MockRepository: Repository {

    let bundle = Bundle.main

    func fetchDogImages(from url: URL) async throws -> [DogImage] {
        dogImages
    }

    func fetchDogDetails(from url: URL) async throws -> DogDetails? {
        dogDetails
    }
}

extension MockRepository {

    var dogDetails: DogDetails {
        DogDetails(
            id: "SkRpsgc47",
            url: bundle.url(forResource: "SkRpsgc47_1280", withExtension: "jpg")!,
            width: 1920,
            height: 1080,
            breeds: nil
        )
    }

    var dogImages: [DogImage] {
        [
            DogImage(
                id: "S1V3Qeq4X",
                url: bundle.url(forResource: "S1V3Qeq4X_1280", withExtension: "jpg")!,
                width: 600,
                height: 483
            ),
            DogImage(
                id: "SkRpsgc47",
                url: bundle.url(forResource: "SkRpsgc47_1280", withExtension: "jpg")!,
                width: 1920,
                height: 1080
            ),
            DogImage(
                id: "Bk-WET6Em",
                url: bundle.url(forResource: "Bk-WET6Em", withExtension: "gif")!,
                width: 290,
                height: 290
            ),
            DogImage(
                id: "Sk67KO2rX",
                url: bundle.url(forResource: "Sk67KO2rX_1280", withExtension: "jpg")!,
                width: 1024,
                height: 683
            ),
            DogImage(
                id: "SyNNYd3S7",
                url: bundle.url(forResource: "SyNNYd3S7_1280", withExtension: "jpg")!,
                width: 1024,
                height: 683
            ),
            DogImage(
                id: "xmHTSrAon",
                url: bundle.url(forResource: "xmHTSrAon_1280", withExtension: "jpg")!,
                width: 1024,
                height: 683
            ),
            DogImage(
                id: "wPIaaiYOy",
                url: bundle.url(forResource: "wPIaaiYOy", withExtension: "jpg")!,
                width: 1288,
                height: 966
            ),
            DogImage(
                id: "38KoA9gGB",
                url: bundle.url(forResource: "38KoA9gGB", withExtension: "jpg")!,
                width: 1080,
                height: 1350
            ),
            DogImage(
                id: "5TKMTrS09",
                url: bundle.url(forResource: "5TKMTrS09", withExtension: "jpg")!,
                width: 1080,
                height: 1080
            ),
            DogImage(
                id: "9POof5zD0",
                url: bundle.url(forResource: "9POof5zD0", withExtension: "jpg")!,
                width: 1200,
                height: 1197
            )
        ]
    }
}
