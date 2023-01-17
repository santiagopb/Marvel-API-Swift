//
//  Url.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class Url: Object {
    @Persisted var type: String
    @Persisted(primaryKey: true) var url: String
    
    static func build(apiObject: ApiObjectUrl) -> Url? {
        guard let url = apiObject.url else { return nil }
        
        let object = Url()
        object.type = apiObject.type ?? ""
        object.url = url
        
        return object
    }
}
