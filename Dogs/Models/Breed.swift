//
//  Copyright © 2024 Pedro Monteverde. All rights reserved.
//

import Foundation

struct Breed: Codable {
    let weight: Measure?
    let height: Measure?
    let id: Int
    let name: String
    let temperament: String
    let origin: String?
    let country_codes: String?
    let country_code: String?
    let life_span: String
    let wikipedia_url: URL?
    let bred_for: String?
    let reference_image_id: String?
    let breed_group: String?
}
