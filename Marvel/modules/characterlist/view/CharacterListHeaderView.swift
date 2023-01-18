//
//  CharacterListHeaderView.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation
import UIKit

class CharacterListHeaderView: UICollectionReusableView {
    
    static let id = "CharacterListHeaderView"
    let title = "MARVEL CHARACTERS"
    let summary = "Get hooked on a hearty helping of heroes and villains from the humble House of Ideas!"
    let thumbnailUrl = "https://terrigen-cdn-dev.marvel.com/content/prod/1x/characters_art_mas_mob_01.jpg"
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 26)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        imageContainer.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imageContainer.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        imageContainer.addSubview(summaryLabel)
        summaryLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        addSubview(imageContainer)
        imageContainer.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        thumbnailImageView.setImageUrl(thumbnailUrl, placeholder: "slowmo")
        titleLabel.text = title.uppercased()
        summaryLabel.text = summary
    }
}
