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
        layout.itemSize = .init(width: 190, height: 335)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func configureNavigation() {
        navigationController?.navigationBar.barTintColor = UIColor.init(named: "grey")
        navigationController?.navigationBar.isTranslucent = false
        /*UINavigationBar.appearance().barTintColor = .blue
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        UINavigationBar.appearance().isTranslucent = false*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureCollectionView()
        presenter?.viewIsReady()
        navigationController?.navigationBar.barTintColor = UIColor.init(named: "grey")
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.bottom.equalTo(view)
            make.trailing.equalTo(view)
            make.leading.equalTo(view)
        }
        
        collectionView.dataSource = self
        collectionView.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.id)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.id, for: indexPath) as? CharacterViewCell else {
            return UICollectionViewCell()
        }
        
        let character = characters[indexPath.row]
        
        cell.configure(character)
        return cell
    }
    
    
}