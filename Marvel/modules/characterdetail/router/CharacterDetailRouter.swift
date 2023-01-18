//
//  CharacterDetailRouter.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation
import UIKit

class CharacterDetailRouter: PresenterToRouterCharacterDetailProtocol {
    
    static func navigateToCharacterDetail(with id: Int, controller: UINavigationController) {
        let view = createModuleWith(id)
        view.modalPresentationStyle = .fullScreen
        controller.pushViewController(view, animated: true)
    }
    
    
    static func createModuleWith(_ idCharacter: Int) -> UIViewController {
        let view = CharacterDetailViewController()
        let presenter: PresenterToViewCharacterDetailProtocol = CharacterDetailPresenter()
        let interactor: PresenterToInteractorCharacterDetailProtocol = CharacterDetailInteractor()
        let router: PresenterToRouterCharacterDetailProtocol = CharacterDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.idCharacter = idCharacter
        
        return view
    }
}
