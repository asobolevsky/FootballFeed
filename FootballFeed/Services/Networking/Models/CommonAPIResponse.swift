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
  let parameters: [String: String]
  let errors: [String]
  let results: Int
  let paging: APIResponsePaging
  let response: Wrapped
  
  enum CodingKeys: CodingKey {
    case get
    case parameters
    case errors
    case results
    case paging
    case response
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.get = try container.decode(String.self, forKey: .get)
    self.parameters = try container.decode([String: String].self, forKey: .parameters)
    self.errors = try container.decode([String].self, forKey: .errors)
    self.results = try container.decode(Int.self, forKey: .results)
    self.paging = try container.decode(APIResponsePaging.self, forKey: .paging)
    self.response = try container.decode(Wrapped.self, forKey: .response)
  }
  
}
