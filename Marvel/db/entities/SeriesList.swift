//
//  SeriesList.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class SeriesList: Object {
    @Persisted var available: Int
    @Persisted var returned: Int
    @Persisted var collectionURI: String
    @Persisted var items: List<SeriesSummary>
    
    static func build(apiObject: ApiObjectSeriesList?) -> SeriesList? {
        guard let apiObject = apiObject else { return nil }

        let object = SeriesList()
        object.available = apiObject.available ?? 0
        object.returned = apiObject.returned ?? 0
        object.collectionURI = apiObject.collectionURI ?? ""
        
        return object
    }
}
