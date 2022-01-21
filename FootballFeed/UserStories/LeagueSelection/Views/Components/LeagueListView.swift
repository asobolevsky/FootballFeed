//
//  LeagueListView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import SwiftUI

struct LeagueListView: View {
  @Binding var selectedLeague: League?
  @StateObject var viewModel: LeagueListViewModel
  
  var body: some View {
    List(viewModel.leagues,
         id: \.self,
         selection: $selectedLeague) { league in
      HStack {
        Text(league.name)
        Spacer()
      }
      .contentShape(Rectangle())
      .onTapGesture {
        selectedLeague = league
      }
    }
  }
}

struct LeagueListView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = LeagueListViewModel(for: Country.previewCountry)
    
    LeagueListView(selectedLeague: .constant(League.previewLeague),
                    viewModel: viewModel)
  }
}
