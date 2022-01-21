//
//  FootballAPIEndpoint.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

enum FootballAPIEndpoint {
  
  enum LeaguesType: String {
    case league
    case cup
  }
  
  case countries(search: String)
  case leagues(country: String, type: LeaguesType = .league)
  
  var headers: [String: String]? {
    switch self {
    default: return nil
    }
  }
  
  var path: String {
    switch self {
    case .countries: return "countries"
    case .leagues: return "leagues"
    }
  }
  
  var parameters: [String: String]? {
    switch self {
    case .countries(let search):
      return [
        "search": search,
      ].compactMapValues { $0 }
      
    case .leagues(let country, let type):
      return [
        "country": country,
        "type": type.rawValue
      ].compactMapValues { $0 }
    }
  }
  
  var fullPath: String {
    var fullPath = path
    if let queryString = parameters?.queryString {
      fullPath += "?\(queryString)"
    }
    return fullPath
  }
}
