//
//  WeatherAPI.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import Foundation
import CoreLocation

class GetWeatherAPI: API {
    
    private struct KeyPath {
        static let Latitude = "latitude"
        static let Longitude = "longitude"
    }
    
    let apiPath = "/weather/"
    
    func perform(at location: CLLocation, completion: @escaping ((Result<Data, APIError>) -> Void)) {
        let config = buildEndpoint(for: location)
        
        NetworkSessionManager.shared.perform(request: .get(config: config)) { [weak self] result in
            completion(self?.handleResponse(result) ?? .failure(.responseParseError))
        }
    }
    
    private func buildEndpoint(for location: CLLocation) -> Endpoint {
        let config = Endpoint(
            path: apiPath,
            queryItems: [
                URLQueryItem(name: KeyPath.Latitude, value: location.coordinate.latitude.toString),
                URLQueryItem(name: KeyPath.Longitude, value: location.coordinate.longitude.toString)
            ]
        )
        
        return config
    }
}
