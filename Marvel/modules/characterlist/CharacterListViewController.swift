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
    var characters: [Character] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 200, height: 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.trailing.equalTo(view)
            make.leading.equalTo(view)
        }
        
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCell")
    }
    
    func setupData(_ data: [Character]) {
        characters = data
        collectionView.reloadData()
    }
    
}

extension CharacterListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}
