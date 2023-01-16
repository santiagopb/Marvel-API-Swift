//
//  MarvelRequestMonitor.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Alamofire

final class MarvelRequestMonitor: EventMonitor {
    func requestDidResume(_ request: Request) {
        let body = request.request.flatMap { $0.httpBody.map { String(decoding: $0, as: UTF8.self) } } ?? "None"
        
        let message = """
        ⚡️ Request Started: \(request)
        ⚡️ Body Data: \(body)
        """
        
        Log.info(message)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: AFDataResponse<Value>) {
        let message = "⚡️ Response Received: \(response.debugDescription)"
        Log.info(message)
    }
}
