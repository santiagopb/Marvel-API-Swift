//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController, ViewToPresenterCharacterDetailProtocol {
    
    var presenter: PresenterToViewCharacterDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigation()
        configureView()
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
    
    func configureView() {
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
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageContainer)
        stackView.addArrangedSubview(descriptionContainer)
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
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
    
    func setupData(_ model: Character) {
        thumbnailImageView.setImageUrl(model.thumbnailUrl, placeholder: "slowmo")
        nameLabel.text = model.name.uppercased()
    }
}
