//
//  CharacterDetailRouter.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation
import UIKit

class CharacterDetailRouter: PresenterToRouterCharacterDetailProtocol {
    
    static func navigateToCharacterDetail(controller: UINavigationController, data: Character) {
        let view = createModuleWith(data)
        view.modalPresentationStyle = .fullScreen
        controller.pushViewController(view, animated: true)
    }
    
    
    static func createModuleWith(_ data: Character) -> UIViewController {
        let view = CharacterDetailViewController()
        let presenter: PresenterToViewCharacterDetailProtocol = CharacterDetailPresenter()
        let interactor: PresenterToInteractorCharacterDetailProtocol = CharacterDetailInteractor()
        let router: PresenterToRouterCharacterDetailProtocol = CharacterDetailRouter()
        
        view.presenter = presenter
        presenter.view = view as? ViewToPresenterCharacterDetailProtocol
        presenter.interactor = interactor
        presenter.router = router
        presenter.character = data
        
        return view
    }
}
