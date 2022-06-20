//
//  LeagueListView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-18.
//

import SwiftUI

struct LeagueListView: View {
    let country: Country
    @StateObject private var model = LeagueListViewModel()
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                ZStack(alignment: .bottom) {
                    List(model.leagueList) { league in
                        LeagueRowView(league: league)
                    }
                    .searchable(text: $model.searchText, prompt: "Start entering league name")
                }
            }
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task {
                model.searchText = ""
                do {
                    try await model.loadLeagueList(for: country)
                } catch {
                    await MainActor.run {
                        self.errorMessage = "Error loading countries"
                    }
                }
            }
        }
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueListView(country: Country.example)
    }
}
