//
//  CharacterListInteractor.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterListInteractor: PresenterToInteractorCharacterListProtocol {
    
    func loadCharacters(completion: @escaping (Results<Character>?) -> Void) {
        let repository = CharacterRepository(apiRestMarvel: ApiRestManager.shared.apiRestMarvel,
                                             characterDao: CharacterDao())
        repository.getCharacters(completion: completion)
    }
}
