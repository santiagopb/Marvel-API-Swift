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
    
    static func build(apiObject: [ApiObjectStorySummary]?) -> List<StorySummary> {
        let data: List<StorySummary> = List<StorySummary>()
        
        guard let apiObject = apiObject,
              apiObject.count > 0 else { return data }
        
        apiObject.forEach { item in
            let object = StorySummary()
            object.resourceURI = item.resourceURI ?? ""
            object.name = item.name ?? ""
            object.type = item.type ?? ""
            
            data.append(object)
        }
        
        return data
    }
}
