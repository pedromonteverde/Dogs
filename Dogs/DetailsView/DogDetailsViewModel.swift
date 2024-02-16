//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import Foundation

class DogDetailsViewModel: ObservableObject {

    let id: String
    let repository: Repository

    @Published var url: URL?
    @Published var name: String?
    @Published var weight: String?
    @Published var height: String?
    @Published var temperament: String?
    @Published var origin: String?
    @Published var countryCode: String?
    @Published var lifeSpan: String?
    @Published var wikipedia: String?
    @Published var bredFor: String?
    @Published var breedGroup: String?

    @Published var error: Error?

    init(id: String, repository: Repository) {
        self.id = id
        self.repository = repository
    }

    func fetch() {

        Task { @MainActor in
            do {
                guard var url = URL(string: API.baseURL + id) else {
                    error = FetchingError.invalidURL
                    return
                }

                url.append(queryItems: [
                    URLQueryItem(name: "api_key", value: API.key)
                ])

                let dogDetails = try await repository.fetchDogDetails(from: url)
                self.map(dogDetails)
            } catch {
                self.error = error
            }
        }
    }

    private func map(_ dogDetails: DogDetails?) {
        self.url = dogDetails?.url
        self.name = dogDetails?.breeds?.first?.name
        self.weight = dogDetails?.breeds?.first?.weight?.metric
        self.height = dogDetails?.breeds?.first?.height?.metric
        self.temperament = dogDetails?.breeds?.first?.temperament
        self.origin = dogDetails?.breeds?.first?.origin
        self.countryCode = dogDetails?.breeds?.first?.country_code
        self.lifeSpan = dogDetails?.breeds?.first?.life_span
        self.wikipedia = dogDetails?.breeds?.first?.wikipedia_url?.description
        self.bredFor = dogDetails?.breeds?.first?.bred_for
        self.breedGroup = dogDetails?.breeds?.first?.breed_group
    }
}
