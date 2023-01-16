//
//  ApiObjectCharacter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class ApiObjectCharacter: Codable {
    let id: String?
    let name: String?
    let description: String?
    let modified: String?
    let resourceURI: String?
    let urls: ApiObjectUrl?
    let thumbnail: ApiObjectImage?
    let comics: ApiObjectComicList?
    let stories: ApiObjectStoryList?
    let events: ApiObjectEventList?
    let series: ApiObjectSeriesList?
}
