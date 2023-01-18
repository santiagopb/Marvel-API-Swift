//
//  CharacterDetailProtocols.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import RealmSwift

protocol ViewToPresenterCharacterDetailProtocol: AnyObject {
    var presenter: PresenterToViewCharacterDetailProtocol? { get set }
    func setupData(_ data: Character)
}

protocol PresenterToViewCharacterDetailProtocol: AnyObject {
    var view: ViewToPresenterCharacterDetailProtocol? { get set }
    var interactor: PresenterToInteractorCharacterDetailProtocol? { get set }
    var router: PresenterToRouterCharacterDetailProtocol? { get set }
    var character: Character? { get set }
    func viewIsReady()
}

protocol PresenterToInteractorCharacterDetailProtocol: AnyObject {
    func loadCharacter(id: Int, completion: @escaping (Character?) -> Void)
}

protocol PresenterToRouterCharacterDetailProtocol: AnyObject {

}
