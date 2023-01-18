//
//  EventSummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class EventSummary: EmbeddedObject {
    @Persisted var resourceURI: String
    @Persisted var name: String
    
    static func build(apiObject: ApiObjectEventSummary?) -> EventSummary? {
        guard let apiObject = apiObject else { return nil }
        
        let object = EventSummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = apiObject.name ?? ""
        
        return object
    }
}
