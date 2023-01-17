//
//  CharacterViewCell.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation
import UIKit
import Kingfisher

class CharacterViewCell: UICollectionViewCell {
    
    static let id = "CharacterViewCell"
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 0
        return stackView
    }()
    
    private let imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(named: "grey")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let line = UIView()
        line.backgroundColor = UIColor.init(named: "red")
        
        view.addSubview(line)
        line.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.height.equalTo(4)
        }
        
        return view
    }()
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "RobotoCondensed-Bold", size: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        imageContainer.addSubview(thumbnailImageView)
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        descriptionContainer.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        addSubview(stackView)
        stackView.addArrangedSubview(imageContainer)
        stackView.addArrangedSubview(descriptionContainer)
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: Character) {
        thumbnailImageView.setImageUrl(model.thumbnailUrl, placeholder: "slowmo")
        nameLabel.text = model.name.uppercased()
    }
}
