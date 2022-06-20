//
//  LeagueRowView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import SwiftUI

struct LeagueRowView: View {
    let league: League

    var body: some View {
        Text(league.name)
    }
}

struct LeagueRowView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueRowView(league: League.example)
    }
}
