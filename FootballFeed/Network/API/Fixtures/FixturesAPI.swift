//
//  FixturesAPI.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

enum FixturesAPI: APIResource {
    case fixtures(team: Int, season: Int)

    var path: String {
        switch self {
        case .fixtures: return "/fixtures"
        }
    }

    var query: [String: String] {
        switch self {
        case .fixtures(let team, let season):
            return [
                "team": "\(team)",
                "season": "\(season)",
            ].compactMapValues { $0 }
        }
    }

}
