//
//  CharacterListViewController.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation
import UIKit
import SnapKit

class CharacterListViewController: UIViewController, ViewToPresenterCharacterListProtocol {
    var presenter: PresenterToViewCharacterListProtocol?
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        configureCollectionView()
        presenter?.viewIsReady()
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .blue
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        /*collectionView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.trailing.equalTo(view)
            make.leading.equalTo(view)
        }*/
        
        
    }
    
}
