//
//  CharacterListPresenter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class CharacterListPresenter: PresenterToViewCharacterListProtocol {
    var view: ViewToPresenterCharacterListProtocol?
    var interactor: PresenterToInteractorCharacterListProtocol?
    var router: PresenterToRouterCharacterListProtocol?
    
    func viewIsReady() {
        loadCharacters()
    }
    
    private func loadCharacters() {
        interactor?.loadCharacters(completion: { response in
            guard let data = response else {
                return
            }
            self.view?.setupData(Array(data))
            print(response)
            print("Ok: 200")
        })
    }
}
