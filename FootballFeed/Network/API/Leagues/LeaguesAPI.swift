//
//  LeaguesAPI.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

enum LeaguesAPI: APIResource {
    case leagues(code: String? = nil, country: String? = nil)

    var path: String {
        switch self {
        case .leagues: return "/leagues"
        }
    }

    var query: [String: String] {
        switch self {
        case .leagues(let code, let country):
            return [
                "code": code,
                "country": country,
            ].compactMapValues { $0 }
        }
    }
}
