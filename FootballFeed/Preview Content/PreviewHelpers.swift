//
//  PreviewHelpers.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import Foundation

extension Country {
  static var previewCountry: Country {
    return Country(name: "Test")
  }
}

extension League {
  static var previewLeague: League {
    return League(id: 0, name: "Test", type: .league, logo: nil)
  }
}
