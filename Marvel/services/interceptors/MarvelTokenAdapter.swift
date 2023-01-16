//
//  MarvelTokenAdapter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Alamofire

class MarvelTokenAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        let apiPublicKey = "3f8a28a3ffcc869b5e314e5220a4b8e7"
        let apiPrivateKey = "6a79f3c0a905c586aec3d6be8342489f7ff24c20"
        
        let hash = (apiPrivateKey + apiPublicKey).md5Hash()
        
        let params: Parameters = [
            "apikey": apiPublicKey,
            "ts":"",
            "hash":hash
        ]
        
        guard let urlRequest = try? URLEncoding.default.encode(urlRequest, with: params) else {
            completion(Result.failure(AuthenticationError.missingCredential))
            return
        }
        
        completion(Result.success(urlRequest))
    }
    
}
