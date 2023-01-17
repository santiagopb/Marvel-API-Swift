//
//  Character.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class Character: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var summary: String
    @Persisted var modified: String
    @Persisted var resourceURI: String
    @Persisted var urls: List<Url>
    @Persisted var thumbnail: Image?
    @Persisted var comics: ComicList?
    @Persisted var stories: StoryList?
    @Persisted var events: EventList?
    @Persisted var series: SeriesList?
    
    static func build(apiObject: ApiObjectCharacter) -> Character? {
        guard let id = apiObject.id else { return nil }
        
        let object = Character()
        object.id = id
        object.name = apiObject.name ?? ""
        object.summary = apiObject.description ?? ""
        object.modified = apiObject.modified ?? ""
        object.resourceURI = apiObject.resourceURI ?? ""
        object.urls = List<Url>()
        
        return object
    }
}
