//
//  ComicList.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class ComicList: Object {
    @Persisted var available: Int
    @Persisted var returned: Int
    @Persisted var collectionURI: String
    @Persisted var items: List<ComicSummary>
    
    static func build(apiObject: ApiObjectComicList?) -> ComicList? {
        guard let apiObject = apiObject else { return nil }

        let object = ComicList()
        object.available = apiObject.available ?? 0
        object.returned = apiObject.returned ?? 0
        object.collectionURI = apiObject.collectionURI ?? ""
        
        return object
    }
}
