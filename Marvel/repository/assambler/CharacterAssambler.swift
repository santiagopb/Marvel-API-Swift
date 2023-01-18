//
//  CharacterAssambler.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterAssambler {
    private var characterDao: CharacterDao
    
    init(characterDao: CharacterDao) {
        self.characterDao = characterDao
    }
    
    /// Guardamos en base de datos  la lista de personajes de historietas
    ///  - Parameter apiObject: ApiObjectCharacterDataWrapper: contiene el listado obtenido del WS
    ///  - Parameter isFirstPage: Bool: se utiliza para limpiar los registros de la base en la primera lectura paginada del WS
    func assamble(apiObject: ApiObjectCharacterDataWrapper, isFirstPage: Bool = false) {
        guard let _characters = apiObject.data?.results else { return }
        
        if isFirstPage {
            _ = characterDao.removeCharacters()
        }
        
        var objects: [Object] = []
        
        for _item in _characters {
            if let character = Character.build(apiObject: _item) {
                objects.append(character)
            } else {
                Log.error("Fail building Character list with data \(_item)")
            }
        }
        
        characterDao.addObjects(with: objects)
    }
    
}
