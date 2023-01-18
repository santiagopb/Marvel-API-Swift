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
    
    static func build(apiObject: [ApiObjectEventSummary]?) -> List<EventSummary> {
        let data: List<EventSummary> = List<EventSummary>()
        
        guard let apiObject = apiObject,
              apiObject.count > 0 else { return data }
        
        apiObject.forEach { item in
            let object = EventSummary()
            object.resourceURI = item.resourceURI ?? ""
            object.name = item.name ?? ""
            
            data.append(object)
        }
        
        return data
    }

}
