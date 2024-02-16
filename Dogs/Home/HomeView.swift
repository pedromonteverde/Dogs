//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Spacer()
                    if viewModel.fetching {
                        ProgressView()
                    }
                    Text("\(viewModel.images.count)").padding(.leading, 16)
                }
                ZStack {
                    List {
                        ForEach(viewModel.images, id: \.url) { image in
                            NavigationLink(
                                destination: DogDetailsView(
                                    viewModel: DogDetailsViewModel(
                                        id: image.id,
                                        repository: viewModel.repository
                                    )
                                )
                            ) {
                                DogCellView(viewModel: viewModel, image: image)
                            }
                            .accessibilityIdentifier(Accessibility.Home.cell)
                        }
                    }
                    .accessibilityIdentifier(Accessibility.Home.list)
                    .refreshable {
                        viewModel.fetchMore()
                    }
                    .animation(.default, value: viewModel.images.count)
                }
            }
            .navigationBarTitle("Dogs")
        }
        .padding()
        .errorAlert(error: $viewModel.error)
        .onAppear {
            viewModel.fetchMore()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(repository: DefaultRepository()))
}
