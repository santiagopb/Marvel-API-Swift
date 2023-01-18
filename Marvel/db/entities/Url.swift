//
//  Url.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class Url: EmbeddedObject {
    @Persisted var type: String
    @Persisted var url: String
    
    static func build(apiObject: [ApiObjectUrl]?) -> List<Url> {
        guard let apiObject = apiObject, apiObject.count > 0 else {
            return List<Url>()
        }
        
        let data: List<Url> = List<Url>()
        
        apiObject.forEach { item in
            let object = Url()
            object.type = item.type ?? ""
            object.url = item.url ?? ""
            
            data.append(object)
        }
        
        return data
    }
    /*
    static func build(apiObject: ApiObjectUrl?) -> Url? {
        guard let apiObject = apiObject else { return nil }
        
        let object = Url()
        object.type = apiObject.type ?? ""
        object.url = apiObject.url ?? ""
        
        return object
    }*/
}
