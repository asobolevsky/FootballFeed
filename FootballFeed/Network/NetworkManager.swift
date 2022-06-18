//
//  NetworkManager.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

enum NetworkManagerError: Error {
    case networkError(cause: Error)
    case dataIsNil
    case decodingError
}

struct NetworkManager {
    private let baseUrl = URL(string: FFApp.config.footballApiBaseUrl)!

    func performRequest<R: Decodable>(for resource: APIResource) async throws -> R {
        return try await withCheckedThrowingContinuation { continuation in
            let resourceFullUrl = baseUrl.appendingPathComponent(resource.path)
            var request = URLRequest(url: resourceFullUrl)

            request.addValue(FFApp.config.apiKey, forHTTPHeaderField: "x-apisports-key")
            request.addValue(resourceFullUrl.host!, forHTTPHeaderField: "x-rapidapi-host")

            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    continuation.resume(throwing: NetworkManagerError.networkError(cause: error!))
                    return
                }

                guard let data = data else {
                    continuation.resume(throwing: NetworkManagerError.dataIsNil)
                    return
                }

                do {
                    let result = try JSONDecoder().decode(R.self, from: data)
                    continuation.resume(returning: result)
                    return
                } catch {
                    print("Decoding error: \(error)")
                    continuation.resume(throwing: NetworkManagerError.decodingError)
                }
            }.resume()
        }
    }

}
