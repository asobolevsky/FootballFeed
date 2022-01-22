//
//  TeamsResponseItem.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import Foundation

struct TeamsResponseItem: Decodable {
  let team: Team
  let venue: Venue
}
