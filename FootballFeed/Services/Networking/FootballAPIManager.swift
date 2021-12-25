//
//  FootballAPIManager.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

enum FootballAPIManagerError: Error {
    case couldNotCreateRequest
    case emptyData
}

class FootballAPIManager: FootballAPIManaging {
    // TODO: Introduce ServiceLocator
    static let shared = FootballAPIManager()
    
    let session = URLSession.shared
    
    private let baseURL = "https://v3.football.api-sports.io/"
    private let token = "dc9d9c2e1a821ea6877779b7b1ddf836"
    
    func fetch<T: Decodable>(endpoint: FootballAPIEndpoint, completion: @escaping (APIResult<T>) -> ()) {
        // TODO: Add error throwing
        guard let request = request(for: endpoint) else {
            completion(.failure(FootballAPIManagerError.couldNotCreateRequest))
            return
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            // TODO: - Finish
            
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(CommonAPIResponse<T>.self, from: data)
                    completion(.success(result.response))
                } catch {
                    print(error)
                    completion(.failure(FootballAPIManagerError.couldNotCreateRequest))
                }
            } else {
                completion(.failure(FootballAPIManagerError.emptyData))
            }
        }
        task.resume()
    }
    
    private func request(for endpoint: FootballAPIEndpoint) -> URLRequest? {
        let urlString = baseURL + endpoint.fullPath
        
        // TODO: Add error throwing
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        var headers = [ "x-apisports-key": token ]
        if let endpointHeaders = endpoint.headers {
            headers.merge(endpointHeaders) { (_, new) in new }
        }
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
