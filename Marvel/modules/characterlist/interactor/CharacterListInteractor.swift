//
//  CharacterListInteractor.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterListInteractor: PresenterToInteractorCharacterListProtocol {
    
    let repository = CharacterRepository(apiRestMarvel: ApiRestMarvel(url: ApiRestMarvel.BASE_URL,
                                                                      requestRetrier: nil,
                                                                      requestAdapter: MarvelRequestAdapter(),
                                                                      eventMonitor: MarvelEventMonitor(),
                                                                      urlProtocols: nil),
                                         characterDao: CharacterDao())
    
    func loadCharacters(onFirstPage: Bool? = false, completion: @escaping (Results<Character>?, Bool) -> Void) {
        repository.getCharacters(onFirstPage: onFirstPage, completion: completion)
    }
    
}
