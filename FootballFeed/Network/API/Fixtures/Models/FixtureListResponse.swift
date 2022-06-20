//
//  FixtureListResponse.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

struct FixtureListResponse: Decodable {
    let results: Int
    let response: [Fixture]
}
