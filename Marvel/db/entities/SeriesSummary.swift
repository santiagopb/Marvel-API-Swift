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
    
    static func build(apiObject: ApiObjectSeriesSummary?) -> SeriesSummary? {
        guard let apiObject = apiObject else { return nil }
        
        let object = SeriesSummary()
        object.resourceURI = apiObject.resourceURI ?? ""
        object.name = apiObject.name ?? ""
        
        return object
    }
}
