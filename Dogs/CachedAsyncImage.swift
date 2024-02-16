//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

struct CachedAsyncImage<Content: View>: View {

    let url: URL
    let content: (Image) -> Content

    @State private var phase: Phase = .empty

    enum Phase {
        case none
        case empty
        case success(Image)
        case failure(Error)
    }

    var body: some View {
        HStack {
            switch phase {
            case .none:
                EmptyView()
            case .empty:
                ProgressView()
            case .success(let image):
                content(image)
            case .failure:
                Image(systemName: "photo")
            }
        }
        .onAppear {
            Task {
                do {
                    if let image = try await ImageFetcher.shared.get(from: url) {
                        phase = .success(image)
                    } else {
                        phase = .none
                    }
                } catch {
                    phase = .failure(error)
                }
            }
        }
    }
}
