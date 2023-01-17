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

    func viewIsReady() {
        print("Ahora si el detalle")
    }
    
}
