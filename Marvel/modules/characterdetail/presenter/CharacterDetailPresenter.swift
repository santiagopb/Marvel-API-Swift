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
    var idCharacter: Int?

    func viewIsReady() {
        //Leemos del personaje
        loadCharacter()
    }
    
    private func loadCharacter() {
        guard let id = idCharacter else {
            Log.error("Error loadCharacter without id")
            return
        }
        
        //Leemos
        interactor?.loadCharacter(id: id, completion: { response in
            guard let data = response else {
                Log.error("Can´t find data in loadCharacter")
                return
            }
            //Actualizamos la vista con el resultado
            self.view?.setupData(data)
        })
    }
}
