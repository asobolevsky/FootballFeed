//
//  Country.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

struct Country: Identifiable, Codable {
    var id: String {
        return name
    }
    
    let name: String
    let code: String?
    let flag: String?
}
