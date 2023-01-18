//
//  CharacterDao.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterDao: DaoManager {
    
    /// Obtenemos el listado de personajes almacenados
    ///  - Returns: `Results<Character>` o nil
    func getCharacters() -> Results<Character>? {
        do {
            return try get(type: Character.self, predicate: nil, sort: [SortDescriptor(keyPath: "name", ascending: true)])
        } catch _ as NSError {
            return nil
        }
    }
    
    /// Obtenemos un personaje por Id
    ///  - Parameter id: Int: se utiliza para filtrar la busqueda del personaje
    ///  - Returns: `Character` o nil
    func getCharacter(id: Int) -> Character? {
        do {
            return try get(type: Character.self, key: id)
        } catch _ as NSError {
            return nil
        }
    }
    
    /// Eliminamos todos los personaje almacenados
    ///  - Returns: `Bool`
    func removeCharacters() -> Bool {
        do {
            try delete(type: Character.self, predicate: nil)
            return true
        } catch _ as NSError {
            return false
        }
    }
}
