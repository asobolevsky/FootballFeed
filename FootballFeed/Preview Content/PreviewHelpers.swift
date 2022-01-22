//
//  PreviewHelpers.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import Foundation

extension Country {
  static var test: Country {
    return Country(name: "Test")
  }
}

extension League {
  static var test: League {
    return League(id: 0, name: "Test", type: .league, logo: nil)
  }
}

extension Team {
  static var test: Team {
    return Team(id: 0, name: "Test", logo: nil)
  }
}
