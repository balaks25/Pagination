//
//  NetworkManager.swift
//  Sample
//
//  Created by Balaji K S on 01/05/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkManager {
    
    // Singleton instance 
    static let shared = NetworkManager()
    
    private init() {}
    
    func request(url: URL, method: HTTPMethod, parameters: [String: Any]?, completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Add parameters to request body if it's a POST request
        if method == .post {
            if let parameters = parameters {
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            }
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check for errors
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check for valid HTTP response
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                let error = NSError(domain: "HTTP", code: statusCode, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            // Check for data
            guard let responseData = data else {
                let error = NSError(domain: "Data", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            completion(.success(responseData))
        }
        
        task.resume()
    }
}
