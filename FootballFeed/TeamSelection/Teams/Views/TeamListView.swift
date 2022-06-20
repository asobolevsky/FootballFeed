//
//  TeamListView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import SwiftUI

struct TeamListView: View {
    let league: League
    @AppStorage("selectedTeams") var selectedTeams: Set<Team> = []
    @StateObject private var model = TeamListViewModel()
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                ZStack(alignment: .bottom) {
                    List(model.teamList) { team in
                        let isSelected = selectedTeams.contains(team)
                        TeamRowView(team: team, isSelected: isSelected)
                            .onTapGesture {
                                selectedTeams.toggle(team)
                            }
                    }
                    .searchable(text: $model.searchText, prompt: "Start entering team name")
                }
            }
        }
        .navigationTitle(league.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                model.searchText = ""
                do {
                    try await model.loadTeamList(for: league)
                } catch {
                    await MainActor.run {
                        self.errorMessage = "Error loading teams"
                    }
                }
            }
        }
    }
}

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListView(league: League.example)
    }
}
