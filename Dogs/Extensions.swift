//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import SwiftUI

public extension View {
    func errorAlert(error: Binding<Error?>) -> some View {
        alert(
            error.wrappedValue?.localizedDescription ?? "",
            isPresented: .constant(error.wrappedValue != nil),
            actions: {
                Button("OK") {
                    error.wrappedValue = nil
                }
            }
        )
    }
}
