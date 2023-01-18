//
//  CharacterDetailPresenter.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation

class CharacterDetailPresenter: PresenterToViewCharacterDetailProtocol {
    
    var view: ViewToPresenterCharacterDetailProtocol?
    var interactor: PresenterToInteractorCharacterDetailProtocol?
    var router: PresenterToRouterCharacterDetailProtocol?
    
    var character: Character?

    func viewIsReady() {
        loadCharacter()
    }
    
    private func loadCharacter() {
        guard let id = character?.id else { return }
        interactor?.loadCharacter(id: id, completion: { response in
            guard let data = response else {
                return
            }
            self.character = data
            self.view?.setupData(data)
        })
    }
}
