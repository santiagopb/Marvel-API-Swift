//
//  ApiRestManager.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Foundation

class ApiRestManager {
    private var _apiRestMarvel: ApiRestMarvel?
    
    static let shared = ApiRestManager()
    
    private init() {}
    
    var apiRestMarvel: ApiRestMarvel? {
        get {
            if _apiRestMarvel == nil {
                _apiRestMarvel = ApiRestMarvel(url: ApiRestMarvel.BASE_URL,
                                               requestRetrier: nil,
                                               requestAdapter: MarvelTokenAdapter(),
                                               eventMonitor: MarvelRequestMonitor(),
                                               urlProtocols: nil)
            }
            return _apiRestMarvel
        }
    }
}
