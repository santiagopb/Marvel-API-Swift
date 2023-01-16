//
//  ApiObjectImage.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

struct ApiObjectImage: Codable {
    enum CodingKeys: String, CodingKey {
        case path, imageExtension = "extension"
    }
    let path: String?
    let imageExtension: String?
}
