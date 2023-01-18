//
//  ComicSummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class ComicSummary: EmbeddedObject {
    @Persisted var resourceURI: String
    @Persisted var name: String
    
    static func build(apiObject: ApiObjectComicSummary?) -> ComicSummary? {
        guard let apiObject = apiObject else { return nil }
        
        let object = ComicSummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = apiObject.name ?? ""
        
        return object
    }
}
