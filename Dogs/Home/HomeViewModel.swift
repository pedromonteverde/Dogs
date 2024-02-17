//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class HomeViewModel: ObservableObject {

    @Published var error: Error?
    @Published private(set) var images: [DogImage] = []
    @Published private(set) var fetching = false
    @Published private(set) var page = 0

    let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func fetchMore() {
        fetching = true

        Task { @MainActor [weak self] in
            guard let self else { return }
            do {
                guard var url = URL(string: API.baseURL + "search?") else {
                    error = FetchingError.invalidURL
                    fetching = false
                    return
                }

                url.append(queryItems: [
                    URLQueryItem(name: "page", value: "\(page)"),
                    URLQueryItem(name: "limit", value: "\(API.pageLimit)"),
                    URLQueryItem(name: "api_key", value: API.key)
                ])

                let images = try await repository.fetchDogImages(from: url)
                self.images.append(contentsOf: images)
                self.fetching = false
            } catch {
                self.error = error
                self.fetching = false
            }
        }

        page += 1
    }
}
