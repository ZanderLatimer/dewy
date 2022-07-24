//
//  URLComponents.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import Foundation

extension URLComponents {
    
    init(fromRequest request: NetworkRequest) {
        self.init()
        
        self.scheme = KeySpace.Network.scheme
        self.host = KeySpace.Network.baseURL
        self.path = request.endpoint.path
        self.queryItems = request.endpoint.queryItems
    }
}
