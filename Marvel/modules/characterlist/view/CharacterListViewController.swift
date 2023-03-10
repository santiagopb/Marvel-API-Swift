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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigation()
        configureCollectionView()
        presenter?.viewIsReady()
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.barTintColor = UIColor.init(named: "grey")
        navigationController?.navigationBar.isTranslucent = false
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
        collectionView.delegate = self
        collectionView.register(CharacterViewCell.self, forCellWithReuseIdentifier: CharacterViewCell.id)
        collectionView.register(CharacterListHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: CharacterListHeaderView.id)
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

extension CharacterListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: CharacterListHeaderView.id,
                                                                             for: indexPath)
            return headerView
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 60, bottom: 20, right: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard presenter?.isLastPage == false else { return }
        
        let cardHeight: CGFloat = 355
        let offsetY = scrollView.contentOffset.y
        let screenHeight = scrollView.frame.size.height
        let contentHeight = scrollView.contentSize.height
        let minPosition = offsetY + screenHeight + cardHeight
    
        if minPosition >= contentHeight {
            Log.debug("Is loading more.....")
            presenter?.loadMoreCharacters()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        presenter?.navigateToCharacterDetail(with: character.id)
    }
}
