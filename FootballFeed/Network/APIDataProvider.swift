//
//  APIDataProvider.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

protocol APIDataProvider {
    func performRequest<R: Decodable>(for resource: APIResource) async throws -> R
}
