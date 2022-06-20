//
//  NetworkMock.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

enum NetworkMockError: Error {
    case noFileFound(name: String)
    case couldNotParseFile
    case decodingError
}

class NetworkMock: APIDataProvider {
    func performRequest<R: Decodable>(for resource: APIResource) async throws -> R {
        let fileName = fileName(from: resource)
        guard let jsonFileUrl = Bundle.main.url(forResource: "MockResponses/\(fileName)", withExtension: "json") else {
            throw NetworkMockError.noFileFound(name: fileName)
        }

        let jsonData: Data
        do {
            jsonData = try Data(contentsOf: jsonFileUrl)
        } catch {
            throw NetworkMockError.couldNotParseFile
        }

        do {
            let result = try JSONDecoder().decode(R.self, from: jsonData)
            return result
        } catch {
            print("Decoding error: \(error)")
            throw NetworkMockError.decodingError
        }
    }

    private func fileName(from resourse: APIResource) -> String {
        var fileName = resourse.path.trimmingPrefix("/").replacingOccurrences(of: "/", with: "_")
        for key in resourse.query.keys.sorted() {
            fileName += "_\(key)_\(resourse.query[key]?.lowercased() ?? "")"
        }
        return fileName
    }
}
