//
//  CharacterListPresenter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class CharacterListPresenter: PresenterToViewCharacterListProtocol {
    var view: PresenterToViewCharacterListProtocol?
    var interactor: PresenterToInteractorCharacterListProtocol?
    var router: PresenterToRouterCharacterListProtocol?
    
    func viewIsReady() {
        loadCharacters()
    }
    
    private func loadCharacters() {
        interactor?.loadCharacters(completion: { response in
            print(response)
            print("Ok: 200")
        })
    }
}
