//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    
    var presenter: PresenterToViewCharacterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewIsReady()
    }
}
