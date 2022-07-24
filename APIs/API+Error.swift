//
//  API+Error.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import Foundation

enum APIError: Error, LocalizedError {
    
    // Response errors
    case internalServerError(code: Int)
    
    // API errors
    case responseParseError
    case missingData
    case requestError(error: String)
    
    // Other errors
    case unknownError(error: String)
    
    var errorDescription: String? {
        switch self {
        // Response errors
        case .internalServerError(let code): return "Internal server error \(code.toString)."
            
        // API errors
        case .responseParseError: return "Failed to parse API response."
        case .missingData: return "Success response returned with missing data."
        case .requestError(let error): return "Request error: \(error)."
            
        // Other errors
        case .unknownError(let error): return "Unknown error: \(error)."
        }
    }
}
