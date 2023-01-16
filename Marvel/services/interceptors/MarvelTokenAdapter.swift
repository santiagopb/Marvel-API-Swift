//
//  MarvelTokenAdapter.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Alamofire

class MarvelTokenAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        guard let apiPublicKey = ProcessInfo.processInfo.environment["MARVEL_PUBLIC_KEY"],
              let apiPrivateKey = ProcessInfo.processInfo.environment["MARVEL_PRIVATE_KEY"] else {
            Log.error("ERROR: You forgot set MARVEL_PUBLIC_KEY or MARVEL_PRIVATE_KEY")
            completion(Result.failure(AuthenticationError.missingCredential))
            return
        }
        
        let hash = (apiPrivateKey + apiPublicKey).md5Hash()
        
        let params: Parameters = [
            "apikey": apiPublicKey,
            "ts": "",
            "hash": hash
        ]
        
        guard let urlRequest = try? URLEncoding.default.encode(urlRequest, with: params) else {
            completion(Result.failure(AuthenticationError.missingCredential))
            return
        }
        
        completion(Result.success(urlRequest))
    }
    
}
