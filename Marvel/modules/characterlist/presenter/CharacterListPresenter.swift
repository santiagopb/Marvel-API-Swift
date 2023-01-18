//
//  CharacterListPresenter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import UIKit

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
        
        //Leemos
        interactor?.loadCharacters(onFirstPage: onFirstPage, completion: { (response, isLastPage) in
            self.isLastPage = isLastPage
            guard let data = response else {
                return
            }
            //Actualizamos la vista con el resultado
            self.view?.setupData(Array(data))
        })
    }
    
    func loadMoreCharacters() {
        //Leemos la siguiente pagina
        loadCharacters()
    }
    
    func navigateToCharacterDetail(with id: Int) {
        guard let controller = (view as? UIViewController)?.navigationController else {
            return
        }
        router?.navigateToCharacterDetail(id: id, controller: controller)
    }
}
