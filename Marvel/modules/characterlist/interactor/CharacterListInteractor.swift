//
//  CharacterListInteractor.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterListInteractor: PresenterToInteractorCharacterListProtocol {
    
    let repository = CharacterRepository(apiRestMarvel: ApiRestManager.shared.apiRestMarvel,
                                         characterDao: CharacterDao())
    
    func loadCharacters(onFirstPage: Bool? = false, completion: @escaping (Results<Character>?, Bool) -> Void) {
        repository.getCharacters(onFirstPage: onFirstPage, completion: completion)
    }
    
}
