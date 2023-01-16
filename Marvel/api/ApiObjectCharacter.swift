//
//  ApiObjectCharacter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

struct ApiObjectCharacter: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let resourceURI: String?
    let urls: [ApiObjectUrl]?
    let thumbnail: ApiObjectImage?
    let comics: ApiObjectComicList?
    let stories: ApiObjectStoryList?
    let events: ApiObjectEventList?
    let series: ApiObjectSeriesList?
}
