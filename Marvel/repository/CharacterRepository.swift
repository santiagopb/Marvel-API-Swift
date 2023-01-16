//
//  CharacterRepository.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class CharacterRepository {
    
    fileprivate var apiRestMarvel: ApiRestMarvel
    private var page = 1
    
    init(apiRestMarvel: ApiRestMarvel) {
        self.apiRestMarvel = apiRestMarvel
    }
    
    func getCharacters() {
        self.apiRestMarvel.getCharacters(limit: ApiRestMarvel.LIMIT_PER_PAGE, page: page)?.responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let data):
                if let apiObject = ApiObjectCharacterDataWrapper.build(with: response, to: ApiObjectCharacterDataWrapper.self) {
                    Log.debug("getCharacter - Ok with data \(data)")
                    //TODO: salvar
                } else {
                    Log.debug("getCharacter - Ok without data")
                }
            case .failure(let error):
                Log.error("getCharacter - Fail ")
            }
        })
    }
}
