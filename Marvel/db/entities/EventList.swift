//
//  EventList.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class EventList: Object {
    @Persisted var available: Int
    @Persisted var returned: Int
    @Persisted(primaryKey: true) var collectionURI: String
    @Persisted var items: List<EventSummary>
    
    static func build(apiObject: ApiObjectEventList?) -> EventList? {
        guard let apiObject = apiObject else { return nil }

        let object = EventList()
        object.available = apiObject.available ?? 0
        object.returned = apiObject.returned ?? 0
        object.collectionURI = apiObject.collectionURI ?? ""
        
        return object
    }
}
