//
//  Team.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import Foundation

struct Team: Identifiable, Codable, Hashable {
  let id: Int
  let name: String
  let logo: String?
}
