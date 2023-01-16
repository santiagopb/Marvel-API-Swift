//
//  CharacterListProtocols.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

protocol ViewToPresenterCharacterListProtocol: AnyObject {
    var presenter: PresenterToViewCharacterListProtocol? { get set }
}

protocol PresenterToViewCharacterListProtocol: AnyObject {
    var view: PresenterToViewCharacterListProtocol? { get set }
    var interactor: PresenterToInteractorCharacterListProtocol? { get set }
    var router: PresenterToRouterCharacterListProtocol? { get set }
    func viewIsReady()
}

protocol PresenterToInteractorCharacterListProtocol: AnyObject {
    func loadCharacters(completion: @escaping ([Character]) -> Void)
}

protocol PresenterToRouterCharacterListProtocol: AnyObject {
    
}
