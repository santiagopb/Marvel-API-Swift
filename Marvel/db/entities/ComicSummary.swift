//
//  ComicSummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class ComicSummary: Object {
    @Persisted(primaryKey: true) var resourceURI: String
    @Persisted var name: String
    
    static func build(apiObject: ApiObjectComicSummary?) -> ComicSummary? {
        guard let apiObject = apiObject, let name = apiObject.name else { return nil }
        
        let object = ComicSummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = name
        
        return object
    }
}
