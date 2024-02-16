//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import Foundation

struct DogDetails: Codable {
    let id: String
    let url: URL
    let width: Int?
    let height: Int?
    let breeds: [Breed]?
}
