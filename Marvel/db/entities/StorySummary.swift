//
//  StorySummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class StorySummary: Object {
    @Persisted var resourceURI: String
    @Persisted(primaryKey: true) var name: String
    @Persisted var type: String
    
    static func build(apiObject: ApiObjectStorySummary) -> StorySummary? {
        guard let name = apiObject.name else { return nil }
        
        let object = StorySummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = name
        object.type = apiObject.type ?? ""
        
        return object
    }
}
