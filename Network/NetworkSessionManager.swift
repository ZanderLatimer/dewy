//
//  NetworkSessionManager.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import Foundation

class NetworkSessionManager {
    
    static let shared = NetworkSessionManager(baseURL: URL(string: KeySpace.Network.baseURL)!)
    
    private static let TimeoutInterval = 60.0
    
    private let baseURL: URL
    
    private lazy var defaultSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    
    private lazy var backgroundSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "Background")
        return URLSession(configuration: configuration)
    }()
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func perform(request: NetworkRequest, completion: @escaping ((Result<(Data?, HTTPURLResponse), APIError>) -> Void)) {
        guard let url = URLComponents(fromRequest: request).url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        urlRequest.timeoutInterval = NetworkSessionManager.TimeoutInterval
        urlRequest.networkServiceType = .default
        urlRequest.allowsCellularAccess = true
        
        let dataTask = defaultSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestError(error: error.localizedDescription)))
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.responseParseError))
                return
            }
            completion(.success((data, response)))
        }
        
        dataTask.resume()
    }
}
