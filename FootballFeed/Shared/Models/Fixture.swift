//
//  Fixture.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

struct Fixture: Codable {
    let fixture: FixtureInfo
    let teams: FixtureTeams
}

struct FixtureInfo: Codable {
    let id: Int
    let date: Date
    let venue: Venue
}

struct FixtureTeams: Codable {
    let home: Team
    let away: Team
}

extension Fixture: Identifiable {
    var id: Int {
        fixture.id
    }

    var dateString: String {
        DateFormatter.ui.string(from: fixture.date)
    }
}
