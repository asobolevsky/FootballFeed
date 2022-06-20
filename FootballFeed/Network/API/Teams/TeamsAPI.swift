//
//  TeamsAPI.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

enum TeamsAPI: APIResource {
    case teams(league: Int, season: Int)

    var path: String {
        switch self {
        case .teams: return "/teams"
        }
    }

    var query: [String: String] {
        switch self {
        case .teams(let league, let season):
            return [
                "league": "\(league)",
                "season": "\(season)",
            ].compactMapValues { $0 }
        }
    }
    
}
