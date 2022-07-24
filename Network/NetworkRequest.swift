//
//  NetworkRequest.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

enum NetworkRequest {
    case get(config: Endpoint)
    case post(config: Endpoint)
    
    var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
    
    var endpoint: Endpoint {
        switch self {
        case .get(let endpoint): return endpoint
        case .post(let endpoint): return endpoint
        }
    }
}
