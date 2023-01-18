//
//  CharacterDetailInteractor.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import RealmSwift

class CharacterDetailInteractor: PresenterToInteractorCharacterDetailProtocol {
    
    func loadCharacter(id: Int, completion: @escaping (Character?) -> Void) {
        let repository = CharacterRepository(apiRestMarvel: ApiRestManager.shared.apiRestMarvel,
                                             characterDao: CharacterDao())
        repository.getCharacter(id: id, completion: completion)
    }
    
}
