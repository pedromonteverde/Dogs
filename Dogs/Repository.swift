//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import Foundation

protocol Repository {
    func fetchDogImages(from url: URL) async throws -> [DogImage]
    func fetchDogDetails(from url: URL) async throws -> DogDetails?
}

class DefaultRepository: Repository {

    func fetchDogImages(from url: URL) async throws -> [DogImage] {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([DogImage].self, from: data)
    }

    func fetchDogDetails(from url: URL) async throws -> DogDetails? {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(DogDetails?.self, from: data)
    }
}
