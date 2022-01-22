//
//  TeamListRow.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import SwiftUI

struct TeamListRow: View {
  let team: Team
  
  var body: some View {
    HStack {
      if let logoUrl = team.logo {
        Text(team.name)
        Spacer()
        AsyncImage(url: URL(string: logoUrl)) { phase in
          if let image = phase.image {
            image.resizable()
          } else if phase.error != nil {
            EmptyView()
          } else {
            ProgressView()
          }
        }.frame(width: 40, height: 40)
      }
    }
    .contentShape(Rectangle())
  }
}

struct TeamListRow_Previews: PreviewProvider {
  static var previews: some View {
    TeamListRow(team: Team.test)
  }
}
