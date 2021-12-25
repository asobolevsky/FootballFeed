//
//  CommonAPIResponse.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

struct APIResponsePaging: Decodable {
    let current: Int
    let total: Int
}

struct CommonAPIResponse<Wrapped: Decodable>: Decodable {
    let get: String
    // TODO: Redone with dictionaries
//    let parameters: [String: String]
//    let errors: [String: String]
    let parameters: [String]
    let errors: [String]
    let results: Int
    let paging: APIResponsePaging
    let response: Wrapped
}
