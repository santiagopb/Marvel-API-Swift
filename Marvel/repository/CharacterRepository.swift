//
//  CharacterRepository.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterRepository {
    
    private var apiRestMarvel: ApiRestMarvel?
    private var characterDao: CharacterDao
    private var page = 0
    
    init(apiRestMarvel: ApiRestMarvel?, characterDao: CharacterDao) {
        self.apiRestMarvel = apiRestMarvel
        self.characterDao = characterDao
    }
    
    func getCharacters(completion: @escaping (Results<Character>?) -> Void) {
        self.apiRestMarvel?.getCharacters(limit: ApiRestMarvel.LIMIT_PER_PAGE, page: page)?.responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let data):
                if let apiObject = ApiObjectCharacterDataWrapper.build(with: response, to: ApiObjectCharacterDataWrapper.self) {
                    Log.debug("getCharacter - Ok with data \(data)")
                    let assamble = CharacterAssambler(characterDao: self.characterDao)
                    assamble.assamble(dataWrapper: apiObject)
                } else {
                    Log.debug("getCharacter - Ok without data")
                }
            case .failure(let error):
                Log.error("getCharacter - Fail \(error.localizedDescription)")
            }
            completion(self.characterDao.getCharacters())
        })
    }
    
    private func getCharactersFromDatabase() -> Results<Character>? {
        return self.characterDao.getCharacters()
    }
}

