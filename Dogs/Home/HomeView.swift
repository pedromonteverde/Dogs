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
                        .accessibilityIdentifier(Accessibility.Home.amount)
                }
                ZStack {
                    List {
                        Section(
                            footer: ProgressView()
                                .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
                                .listRowSeparator(.hidden).onAppear() {
                                    viewModel.fetchMore()
                                }
                        ) {
                            ForEach(viewModel.images, id: \.id) { image in
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
                    }
                    .accessibilityIdentifier(Accessibility.Home.list)
                    .animation(.default, value: viewModel.images.count)
                }
            }
            .navigationBarTitle("Dogs")
        }
        .padding()
        .errorAlert(error: $viewModel.error)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(repository: DefaultRepository()))
}
