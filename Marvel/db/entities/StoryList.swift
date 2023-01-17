//
//  StoryList.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class StoryList: Object {
    @Persisted var available: Int
    @Persisted var returned: Int
    @Persisted var collectionURI: String
    @Persisted var items: List<StorySummary>
    
    static func build(apiObject: ApiObjectStoryList?) -> StoryList? {
        guard let apiObject = apiObject else { return nil }

        let object = StoryList()
        object.available = apiObject.available ?? 0
        object.returned = apiObject.returned ?? 0
        object.collectionURI = apiObject.collectionURI ?? ""
        
        return object
    }
}
