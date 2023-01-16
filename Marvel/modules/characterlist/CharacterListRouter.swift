//
//  CharacterListRouter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation
import UIKit

class CharacterListRouter: PresenterToRouterCharacterListProtocol {
    
    static func createModule() -> UIViewController {
        let view = CharacterListViewController()
        let presenter: PresenterToViewCharacterListProtocol = CharacterListPresenter()
        let interactor: PresenterToInteractorCharacterListProtocol = CharacterListInteractor()
        let router: PresenterToRouterCharacterListProtocol = CharacterListRouter()
        
        view.presenter = presenter
        presenter.view = view as? PresenterToViewCharacterListProtocol
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
    
}
