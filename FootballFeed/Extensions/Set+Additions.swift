//
//  Set+Additions.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import Foundation

extension Set where Element: Hashable {
  mutating func toggle(_ value: Element) {
    if contains(value) {
      remove(value)
    } else {
      insert(value)
    }
  }
}
