//
//  Fixture+PreviewData.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

extension Fixture {
    static let example = Fixture(
        fixture: FixtureInfo(id: 123, date: Date(), venue: Venue.example),
        teams: FixtureTeams(home: Team.example, away: Team.example)
    )
}
