//
//  CharacterListViewController.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation
import UIKit

class CharacterListViewController: UIViewController, ViewToPresenterCharacterListProtocol {
    var presenter: PresenterToViewCharacterListProtocol?
    
    override func viewDidLoad() {
        presenter?.viewIsReady()
    }
    
}
