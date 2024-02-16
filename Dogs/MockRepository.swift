//
//  MockRepository.swift
//  Dogs
//
//  Created by Pedro Monteverde on 16/02/2024.
//

import Foundation

class MockRepository: Repository {
    func fetchDogImages(from url: URL) async throws -> [DogImage] {
        Tests.dogImages
    }

    func fetchDogDetails(from url: URL) async throws -> DogDetails? {
        Tests.dogDetails
    }
}

extension MockRepository {
    enum Tests {

        static let dogDetails = DogDetails(
            id: "BJT0Jx5Nm",
            url: URL(string: "https://cdn2.thedogapi.com/images/BJT0Jx5Nm_1280.jpg")!,
            width: 1216,
            height: 1131,
            breeds: nil
        )

        static let dogImages = [
            DogImage(
                id: "S1V3Qeq4X",
                url: URL(string: "https://cdn2.thedogapi.com/images/S1V3Qeq4X_1280.jpg")!,
                width: 600,
                height: 483
            ),
            DogImage(
                id: "SkRpsgc47",
                url: URL(string: "https://cdn2.thedogapi.com/images/SkRpsgc47_1280.jpg")!,
                width: 1920,
                height: 1080
            ),
            DogImage(
                id: "Bk-WET6Em",
                url: URL(string: "https://cdn2.thedogapi.com/images/Bk-WET6Em.gif")!,
                width: 290,
                height: 290
            ),
            DogImage(
                id: "Sk67KO2rX",
                url: URL(string: "https://cdn2.thedogapi.com/images/Sk67KO2rX_1280.jpg")!,
                width: 1024,
                height: 683
            ),
            DogImage(
                id: "SyNNYd3S7",
                url: URL(string: "https://cdn2.thedogapi.com/images/SyNNYd3S7_1280.jpg")!,
                width: 1024,
                height: 683
            ),
            DogImage(
                id: "xmHTSrAon",
                url: URL(string: "https://cdn2.thedogapi.com/images/xmHTSrAon_1280.jpg")!,
                width: 1024,
                height: 683
            ),
            DogImage(
                id: "wPIaaiYOy",
                url: URL(string: "https://cdn2.thedogapi.com/images/wPIaaiYOy.jpg")!,
                width: 1288,
                height: 966
            ),
            DogImage(
                id: "38KoA9gGB",
                url: URL(string: "https://cdn2.thedogapi.com/images/38KoA9gGB.jpg")!,
                width: 1080,
                height: 1350
            ),
            DogImage(
                id: "5TKMTrS09",
                url: URL(string: "https://cdn2.thedogapi.com/images/5TKMTrS09.jpg")!,
                width: 1080,
                height: 1080
            ),
            DogImage(
                id: "9POof5zD0",
                url: URL(string: "https://cdn2.thedogapi.com/images/9POof5zD0.jpg")!,
                width: 1200,
                height: 1197
            )
        ]
    }
}
