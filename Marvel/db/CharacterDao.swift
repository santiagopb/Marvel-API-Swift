//
//  CharacterDao.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterDao: DaoManager {
    
    func getCharacters() -> Results<Character>? {
        do {
            return try get(type: Character.self, predicate: nil, sort: [SortDescriptor(keyPath: "name", ascending: true)])
        } catch _ as NSError {
            return nil
        }
    }
    
    func getCharacter(id: Int) -> Character? {
        do {
            return try get(type: Character.self, key: id)
        } catch _ as NSError {
            return nil
        }
    }
    
    func removeCharacters() -> Bool {
        do {
            try delete(type: Character.self, predicate: nil)
            return true
        } catch _ as NSError {
            return false
        }
    }
}
