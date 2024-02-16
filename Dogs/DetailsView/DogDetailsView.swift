//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

struct DogDetailsView: View {

    @StateObject var viewModel: DogDetailsViewModel

    var body: some View {
        VStack {
            if let url = viewModel.url {
                CachedAsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .accessibilityIdentifier(Accessibility.DogDetails.details)
                .frame(maxWidth: 300, maxHeight: 300)
                .padding(.bottom, 8)
                VStack(alignment: .leading) {
                    viewModel.name.map { Text("Name: " + $0).padding(.bottom, 2) }
                    viewModel.weight.map { Text("Weight: " + $0).padding(.bottom, 2) }
                    viewModel.height.map { Text("Height: " + $0).padding(.bottom, 2) }
                    viewModel.temperament.map { Text("Temperament: " + $0).padding(.bottom, 2) }
                    viewModel.origin.map { Text("Origin: " + $0).padding(.bottom, 2) }
                    viewModel.countryCode.map { Text("Country: " + countryName($0)).padding(.bottom, 2) }
                    viewModel.lifeSpan.map { Text("Life Span: " + $0).padding(.bottom, 2) }
                    viewModel.wikipedia.map { Text("Wikipedia: " + $0).foregroundStyle(Color.blue).padding(.bottom, 2) }
                    viewModel.bredFor.map { Text("Bred for: " + $0).padding(.bottom, 2) }
                    viewModel.breedGroup.map { Text("Breed Group: " + $0).padding(.bottom, 2) }
                }
            } else {
                ProgressView()
            }
        }
        .navigationBarTitle("Dog Details")
        .onAppear {
            viewModel.fetch()
        }
        .errorAlert(error: $viewModel.error)
    }
}

func countryName(_ countryCode: String) -> String {
    Locale.current.localizedString(forRegionCode: countryCode) ?? ""
}
