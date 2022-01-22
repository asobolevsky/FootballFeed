//
//  SelectTeamsView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import SwiftUI

struct SelectTeamsView: View {
  var selectedLeague: League
  @State var selectedTeam: Team?
  
  var body: some View {
    VStack {
      TeamListView(selectedTeam: $selectedTeam,
                   viewModel: TeamListViewModel(for: selectedLeague))
    }
    .navigationTitle(Text("Select Teams"))
    .onAppear {
      selectedTeam = nil
    }
  }
}

struct SelectTeamsView_Previews: PreviewProvider {
  static var previews: some View {
    SelectTeamsView(selectedLeague: League.test)
  }
}
