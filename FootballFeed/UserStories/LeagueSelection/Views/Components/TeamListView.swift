//
//  TeamListView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import SwiftUI

struct TeamListView: View {
  @Binding var selectedTeam: Team?
  @StateObject var viewModel: TeamListViewModel
  
  var body: some View {
    List(viewModel.teams,
         selection: $selectedTeam) { team in
      TeamListRow(team: team)
        .onTapGesture {
          selectedTeam = team
        }
    }
  }
}

struct TeamListView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = TeamListViewModel(for: League.test)
    
    TeamListView(selectedTeam: .constant(Team.test),
                 viewModel: viewModel)
  }
}
