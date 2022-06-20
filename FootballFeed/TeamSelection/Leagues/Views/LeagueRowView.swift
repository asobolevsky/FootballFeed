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
        HStack {
            AsyncImage(url: league.logoUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
            }
            .frame(width: 40, height: 40)
            
            Text(league.name)
        }
    }
}

struct LeagueRowView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueRowView(league: League.example)
    }
}
