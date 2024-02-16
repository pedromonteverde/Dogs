//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

struct DogCellView: View {

    @ObservedObject var viewModel: HomeViewModel
    @State var image: DogImage

    var body: some View {
        VStack(alignment: .leading) {
            CachedAsyncImage(url: image.url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 300, maxHeight: 70, alignment: .leading)
            }
        }
        .frame(height: 70)
    }
}
