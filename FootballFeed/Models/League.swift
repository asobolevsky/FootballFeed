//
//  League.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import Foundation

enum LeagueType: String, Codable {
  case league
  case cup
  
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let rawString = try container.decode(String.self)
    
    if let type = LeagueType(rawValue: rawString.lowercased()) {
      self = type
    } else {
      throw DecodingError.dataCorruptedError(in: container,
                                             debugDescription: "Cannot initialize UserType from invalid String value \(rawString)")
    }
  }
}

struct League: Identifiable, Hashable, Equatable {
  let id: Int
  let name: String
  let type: LeagueType
  let logo: String?
}

extension League: Codable {
  enum CodingKeys: CodingKey {
    case id
    case name
    case type
    case logo
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decode(Int.self, forKey: .id)
    self.name = try container.decode(String.self, forKey: .name)
    self.type = try container.decode(LeagueType.self, forKey: .type)
    self.logo = try container.decode(String?.self, forKey: .logo)
  }
}
