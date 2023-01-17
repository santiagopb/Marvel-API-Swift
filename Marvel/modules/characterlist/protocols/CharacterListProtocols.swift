//
//  CharacterListProtocols.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

protocol ViewToPresenterCharacterListProtocol: AnyObject {
    var presenter: PresenterToViewCharacterListProtocol? { get set }
    func setupData(_ data: [Character])
}

protocol PresenterToViewCharacterListProtocol: AnyObject {
    var view: ViewToPresenterCharacterListProtocol? { get set }
    var interactor: PresenterToInteractorCharacterListProtocol? { get set }
    var router: PresenterToRouterCharacterListProtocol? { get set }
    func viewIsReady()
    func loadMoreCharacters()
    var isLastPage: Bool { get }
    func navigateToCharacterDetail(data: Character)
}

protocol PresenterToInteractorCharacterListProtocol: AnyObject {
    func loadCharacters(onFirstPage: Bool?, completion: @escaping (Results<Character>?, Bool) -> Void)
}

protocol PresenterToRouterCharacterListProtocol: AnyObject {
    func navigateToCharacterDetail(controller: UINavigationController, data: Character)
}
