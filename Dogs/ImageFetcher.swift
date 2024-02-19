//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

actor ImageFetcher {

    static var shared = ImageFetcher()

    private(set) var cache: [URL: Image] = [:]

    func get(from url: URL) async throws -> Image? {
        if let image = cache[url] {
            return image
        } else {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else { return nil }
            let image = Image(uiImage: uiImage)
            self.cache[url] = image
            return image
        }
    }
}
