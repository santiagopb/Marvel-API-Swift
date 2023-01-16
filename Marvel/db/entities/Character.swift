//
//  Character.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation
import RealmSwift

class Character: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""
    @Persisted var summary: String = ""
    @Persisted var modified: String = ""
    @Persisted var resourceURI: String = ""
    
    init(id: String, name: String, description: String) {
        self.init()
        self.id = id
        self.name = name
        self.summary = description
    }
}
