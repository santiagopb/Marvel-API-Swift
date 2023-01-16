//
//  ApiObjectCharacterDataWrapper.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

struct ApiObjectCharacterDataWrapper: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: ApiObjectCharacterDataContainer?
    let etag: String?
}
