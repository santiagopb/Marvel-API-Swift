//
//  SeriesSummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class SeriesSummary: EmbeddedObject {
    @Persisted var resourceURI: String
    @Persisted var name: String
    
    static func build(apiObject: [ApiObjectSeriesSummary]?) -> List<SeriesSummary> {
        let data: List<SeriesSummary> = List<SeriesSummary>()
        
        guard let apiObject = apiObject,
              apiObject.count > 0 else { return data }

        apiObject.forEach { item in
            let object = SeriesSummary()
            object.resourceURI = item.resourceURI ?? ""
            object.name = item.name ?? ""
            
            data.append(object)
        }
        
        return data
    }

}
