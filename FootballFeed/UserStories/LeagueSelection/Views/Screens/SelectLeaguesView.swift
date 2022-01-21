//
//  SelectLeaguesView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import SwiftUI

struct SelectLeaguesView: View {
  var selectedCountry: Country
  @State var selectedLeague: League?
  @State var showTeamsView: Bool = false
  
  var body: some View {
      VStack {
        if let selectedLeague = selectedLeague {
          NavigationLink(
            destination: SelectTeamsView(selectedLeague: selectedLeague),
            isActive: .constant(true)
          ) {}
        }
        
        LeagueListView(selectedLeague: $selectedLeague,
                       viewModel: LeagueListViewModel(for: selectedCountry))
      }
      .navigationTitle(Text("Select Leagues"))
      .onAppear {
        selectedLeague = nil
      }
  }
}

struct SelectLeaguesView_Previews: PreviewProvider {
  static var previews: some View {
    SelectLeaguesView(selectedCountry: Country.previewCountry)
  }
}
