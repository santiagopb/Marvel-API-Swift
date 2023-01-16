//
//  Decodable+Extensions.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation
import Alamofire

extension Decodable {
    
    static func build<T: Codable>(with data: AFDataResponse<Any>?, to type: T.Type) -> T? {
        guard let _data = data?.data else {
            return nil
        }
        return decodeData(with: _data, to: type)
    }
    
    static func decodeData<T: Codable>(with data: Data, to type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let request = try decoder.decode(type, from: data)
            return request
        } catch let e {
            Log.error(e.localizedDescription)
            return nil
        }
    }
}
