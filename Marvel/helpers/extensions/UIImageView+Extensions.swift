//
//  UIImageView+Extensions.swift
//  Marvel
//
//  Created by Santiago Pereira on 17/1/23.
//

import Kingfisher

extension UIImageView {
    
    func setImageUrl(_ url: String?, placeholder: String) {
        self.kf.setImage(with: URL(string: url ?? ""),
                         placeholder: UIImage(systemName: placeholder),
                         options: [.transition(.fade(0.2))])
    }
    
}
