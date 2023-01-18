//
//  StorySummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class StorySummary: EmbeddedObject {
    @Persisted var resourceURI: String
    @Persisted var name: String
    @Persisted var type: String
    
    static func build(apiObject: ApiObjectStorySummary?) -> StorySummary? {
        guard let apiObject = apiObject else { return nil }
        
        let object = StorySummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = apiObject.name ?? ""
        object.type = apiObject.type ?? ""
        
        return object
    }
}
