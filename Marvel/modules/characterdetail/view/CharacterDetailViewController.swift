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
        configureNavigation()
        presenter?.viewIsReady()
    }
    
    func configureNavigation() {
        let buttonItem: UIButton = {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.backgroundColor = .white.withAlphaComponent(0.7)
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            return button
        }()
        
        buttonItem.addTarget(self, action: #selector(backToMain), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonItem)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
}
