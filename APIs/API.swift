//
//  API.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import Foundation

protocol API {
    var apiPath: String { get }
}

extension API {
    
    func handleResponse(_ response: Result<(Data?, HTTPURLResponse), APIError>) -> Result<Data, APIError> {
        switch response {
        case .success((let data, let response)):
            
            if let responseError = parseResponseCode(response) {
                return .failure(responseError)
            }
            
            guard let data = data else {
                return .failure(.missingData)
            }
            
            return .success(data)
            
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func parseResponseCode(_ response: HTTPURLResponse) -> APIError? {
        switch response.statusCode {
        case 200...299: return nil
        case 500...599: return .internalServerError(code: response.statusCode)
        default: return .unknownError(error: response.statusCode.toString)
        }
    }
}
