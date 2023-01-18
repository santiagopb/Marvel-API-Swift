//
//  String+Extensions.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation
import CryptoKit

extension String {
    
    func md5Hash() -> String {
        let data = Data(self.utf8)
        return Insecure.MD5.hash(data: data).map {String(format: "%02x", $0)} .joined()
    }
    
}
