//
//  FixtureRowView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import SwiftUI

struct FixtureRowView: View {
    let fixture: Fixture

    var body: some View {
        VStack {
            Text(fixture.dateString)
            
            HStack {
                AsyncImage(url: fixture.teams.home.logoUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Circle()
                        .foregroundColor(.gray)
                }
                .frame(width: 40, height: 40)
                Text(fixture.teams.home.name)
                Spacer()
                Text("-")
                Spacer()
                Text(fixture.teams.away.name)
                AsyncImage(url: fixture.teams.away.logoUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Circle()
                        .foregroundColor(.gray)
                }
                .frame(width: 40, height: 40)
            }
        }
    }
}

struct FixtureRowView_Previews: PreviewProvider {
    static var previews: some View {
        FixtureRowView(fixture: Fixture.example)
    }
}
