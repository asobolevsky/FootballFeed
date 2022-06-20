//
//  TeamListResponse.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

struct TeamListResponse: Decodable {
    let results: Int
    let response: [TeamInfo]
}

struct TeamInfo: Decodable {
    let team: Team
    let venue: Venue
}
