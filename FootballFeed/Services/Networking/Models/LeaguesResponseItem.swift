//
//  LeaguesResponseItem.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import Foundation

struct LeaguesResponseItem: Decodable {
  let league: League
  let seasons: [Season]
  let country: Country
  
  enum CodingKeys: CodingKey {
    case league
    case seasons
    case country
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.league = try container.decode(League.self, forKey: .league)
    self.seasons = try container.decode([Season].self, forKey: .seasons)
    self.country = try container.decode(Country.self, forKey: .country)
  }
}
