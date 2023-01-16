//
//  CharacterListInteractor.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class CharacterListInteractor: PresenterToInteractorCharacterListProtocol {
    
    func loadCharacters(completion: @escaping ([Character]) -> Void) {
        let repository = CharacterRepository(apiRestMarvel: ApiRestManager.shared.apiRestMarvel)
        repository.getCharacters(completion: completion)
    }
}
