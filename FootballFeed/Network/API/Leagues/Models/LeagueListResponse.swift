//
//  LeagueListResponse.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

struct LeagueListResponse: Decodable {
    let results: Int
    let response: [LeagueInfo]
}

struct LeagueInfo: Decodable {
    let league: League
    let country: Country
}
