//
//  Country.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

struct Country: Codable {
    let name: String
    let code: String?
    let flag: String?
}

extension Country: Identifiable {
    var id: String {
        return name
    }
}

extension Country: Hashable, Equatable {}
