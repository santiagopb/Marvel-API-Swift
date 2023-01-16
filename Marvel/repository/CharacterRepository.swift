//
//  CharacterRepository.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class CharacterRepository {
    
    fileprivate var apiRestMarvel: ApiRestMarvel?
    private var page = 0
    private var characterList: [Character] = []
    
    init(apiRestMarvel: ApiRestMarvel?) {
        self.apiRestMarvel = apiRestMarvel
    }
    
    func getCharacters(completion: @escaping ([Character]) -> Void) {
        self.apiRestMarvel?.getCharacters(limit: ApiRestMarvel.LIMIT_PER_PAGE, page: page)?.responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let data):
                if let apiObject = ApiObjectCharacterDataWrapper.build(with: response, to: ApiObjectCharacterDataWrapper.self) {
                    Log.debug("getCharacter - Ok with data \(data)")
                    //TODO: salvar
                } else {
                    Log.debug("getCharacter - Ok without data")
                }
            case .failure(let error):
                Log.error("getCharacter - Fail \(error.localizedDescription)")
            }
        })
    }
}


protocol Repository {
    associatedtype T
    
    func get(id: Int, completionHandler: (T?, Error?) -> Void)
    func list(completionHandler: ([T]?, Error?) -> Void)
    func add(_ item: T, completionHandler: (Error?) -> Void)
    func delete(_ item: T, completionHandler: (Error?) -> Void)
    func edit(_ item: T, completionHandler: (Error?) -> Void)
}

import Combine
protocol CombineRepository {
    associatedtype T
    
    func get(id: Int) -> AnyPublisher<T, Error>
    func list() -> AnyPublisher<[T], Error>
    func add(_ item: T) -> AnyPublisher<Void, Error>
    func delete(_ item: T) -> AnyPublisher<Void, Error>
    func edit(_ item: T) -> AnyPublisher<Void, Error>
}
