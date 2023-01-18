//
//  ComicSummary.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class ComicSummary: EmbeddedObject {
    @Persisted var resourceURI: String
    @Persisted var name: String
    
    
    static func build(apiObject: [ApiObjectComicSummary]?) -> List<ComicSummary> {
        let data: List<ComicSummary> = List<ComicSummary>()
        
        guard let apiObject = apiObject,
              apiObject.count > 0 else {return data }
        
        apiObject.forEach { item in
            let object = ComicSummary()
            object.resourceURI = item.resourceURI ?? ""
            object.name = item.name ?? ""
            
            data.append(object)
        }
        
        return data
    }
}
