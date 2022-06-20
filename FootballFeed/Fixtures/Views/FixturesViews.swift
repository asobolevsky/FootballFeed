//
//  FixturesViews.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import SwiftUI

struct FixturesViews: View {
    @AppStorage("selectedTeams") var selectedTeams: Set<Team> = []

    var body: some View {
        List(Array(selectedTeams)) { team in
            FixtureSectionView(team: team)
        }
    }
}

struct FixturesViews_Previews: PreviewProvider {
    static var previews: some View {
        FixturesViews()
    }
}
