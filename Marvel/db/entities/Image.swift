//
//  Image.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class Image: Object {
    @Persisted var path: String
    @Persisted var imageExtension: String
    
    static func build(apiObject: ApiObjectImage?) -> Image? {
        guard let apiObject = apiObject, let path = apiObject.path else { return nil }
        
        let object = Image()
        object.path = path
        object.imageExtension = apiObject.imageExtension ?? ""
        
        return object
    }
}
