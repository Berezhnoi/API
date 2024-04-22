//
//  APIClient.swift
//  TestApi
//
//  Created by rendi on 22.04.2024.
//

import Foundation

protocol APIEndpoint {
    associatedtype ResponseType: Decodable // Define associated type for response
    
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var body: Data? { get }
}

class APIClient {
    func request<T: APIEndpoint>(_ endpoint: T, completion: @escaping (Result<T.ResponseType, Error>) -> Void) {
        // Construct URL from endpoint path
        guard let url = URL(string: "https://reqres.in/api\(endpoint.path)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        
        // Perform network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Server Error", code: 0, userInfo: nil)))
                return
            }
            
            guard let responseData = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.ResponseType.self, from: responseData)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
