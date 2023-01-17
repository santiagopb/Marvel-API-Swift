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
    var isLastPage: Bool = false
    
    func viewIsReady() {
        //Leemos desde la primera pagina
        loadCharacters(onFirstPage: true)
    }
    
    private func loadCharacters(onFirstPage: Bool? = false) {
        isLastPage = true // Para evitar consultas simultáneas
        interactor?.loadCharacters(onFirstPage: onFirstPage, completion: { (response, isLastPage) in
            self.isLastPage = isLastPage
            guard let data = response else {
                return
            }
            self.view?.setupData(Array(data))
        })
    }
    
    func loadMoreCharacters() {
        //Leemos la siguiente pagina
        loadCharacters()
    }
}
