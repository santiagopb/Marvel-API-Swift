//
//  ApiRestClient.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Alamofire

class ApiRestClient {
    static let LIMIT_PER_PAGE = 10
    
    private var urlService: String
    private var apiPublicKey: String
    private var apiPrivateKey: String
    
    private var manager: Session
    
    init(url: String, apiPublicKey: String, apiPrivateKey: String,
         requestRetrier: RequestRetrier? = nil,
         requestAdapter: RequestAdapter? = nil,
         eventMonitor: EventMonitor? = nil,
         urlProtocols: [AnyClass]? = nil) {
        self.urlService = url
        self.apiPublicKey = apiPublicKey
        self.apiPrivateKey = apiPrivateKey
        
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.protocolClasses = urlProtocols
            return config
        }()
        
        var adapters: [RequestAdapter] = []
        var retriers: [RequestRetrier] = []
        var eventMonitors: [EventMonitor] = []
        
        if let requestAdapter = requestAdapter {
            adapters.append(requestAdapter)
        }
        
        if let requestRetrier = requestRetrier {
            retriers.append(requestRetrier)
        }
        
        if let eventMonitor = eventMonitor {
            eventMonitors.append(eventMonitor)
        }
        
        let interceptor = Interceptor(adapters: adapters,
                                      retriers: retriers)
        
        self.manager = Session(configuration: configuration,
                               interceptor: interceptor,
                               eventMonitors: eventMonitors)
    }
    
    internal func getUrlService(service: String) -> String {
        return self.urlService + service
    }
    
    internal func get(service: String, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.queryString, headers: HTTPHeaders? = nil) -> DataRequest {
        return request(service: service,
                       method: .get,
                       parameters: parameters,
                       encoding: encoding,
                       headers: headers)
    }
    
    private func request(service: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.httpBody, headers: HTTPHeaders? = nil) -> DataRequest {
        
        return manager.request(service,
                               method: method,
                               parameters: parameters,
                               encoding: encoding,
                               headers: headers)
    }
}
