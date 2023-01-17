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
    private var isLastPage: Bool = false
    private var page = 0
    
    init(apiRestMarvel: ApiRestMarvel?, characterDao: CharacterDao) {
        self.apiRestMarvel = apiRestMarvel
        self.characterDao = characterDao
    }
    
    func getCharacters(onFirstPage: Bool? = false, completion: @escaping (Results<Character>?, Bool) -> Void) {
        if onFirstPage == true {
            self.page = 0
            self.isLastPage = false
        } else {
            self.page = self.page + 1
        }
        
        self.apiRestMarvel?.getCharacters(limit: ApiRestMarvel.LIMIT_PER_PAGE, page: self.page)?.responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let data):
                if let apiObject = ApiObjectCharacterDataWrapper.build(with: response, to: ApiObjectCharacterDataWrapper.self) {
                    Log.debug("getCharacter - Ok with data \(data)")
                    let assamble = CharacterAssambler(characterDao: self.characterDao)
                    assamble.assamble(dataWrapper: apiObject, isFirstPage: self.page == 0)
                    
                    self.isLastPage = apiObject.data?.count == 0 ? true : false
                } else {
                    Log.debug("getCharacter - Ok without data")
                }
            case .failure(let error):
                Log.error("getCharacter - Fail \(error.localizedDescription)")
            }
            completion(self.characterDao.getCharacters(), self.isLastPage)
        })
    }
    
    private func getCharactersFromDatabase() -> Results<Character>? {
        return self.characterDao.getCharacters()
    }
}

