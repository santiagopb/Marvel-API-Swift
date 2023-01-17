//
//  EventSummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class EventSummary: Object {
    @Persisted var resourceURI: String
    @Persisted(primaryKey: true) var name: String
    
    static func build(apiObject: ApiObjectEventSummary) -> EventSummary? {
        guard let name = apiObject.name else { return nil }
        
        let object = EventSummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = name
        
        return object
    }
}
