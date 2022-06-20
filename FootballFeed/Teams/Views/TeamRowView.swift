//
//  TeamRowView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import SwiftUI

struct TeamRowView: View {
    let team: Team

    var body: some View {
        HStack {
            AsyncImage(url: team.logoUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Circle()
                    .foregroundColor(.gray)
            }
            .frame(width: 40, height: 40)

            Text(team.name)
        }
    }
}

struct TeamRowView_Previews: PreviewProvider {
    static var previews: some View {
        TeamRowView(team: Team.example)
    }
}
