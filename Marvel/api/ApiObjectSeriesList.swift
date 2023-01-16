//
//  ApiObjectSeriesList.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class ApiObjectSeriesList: Codable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ApiObjectSeriesSummary]?
}
