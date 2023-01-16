//
//  CharacterListProtocols.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

protocol ViewToPresenterCharacterListProtocol: AnyObject {
    var presenter: ViewToPresenterCharacterListProtocol? { get set }
    func viewIsReady()
}

protocol PresenterToViewCharacterListProtocol: AnyObject {
    var view: PresenterToViewCharacterListProtocol? { get set }
    var interactor: PresenterToInteractorCharacterListProtocol? { get set }
    var router: PresenterToRouterCharacterListProtocol? { get set }
}

protocol PresenterToInteractorCharacterListProtocol: AnyObject {
    
}

protocol PresenterToRouterCharacterListProtocol: AnyObject {
    
}
