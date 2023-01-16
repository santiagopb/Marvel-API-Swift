//
//  ApiObjectCharacterDataContainer.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class ApiObjectCharacterDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [ApiObjectCharacter]?
}
