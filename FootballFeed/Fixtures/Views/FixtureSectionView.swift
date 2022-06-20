//
//  FixtureSectionView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import SwiftUI

struct FixtureSectionView: View {
    let team: Team

    @StateObject private var model = FixtureSectionViewModel()
    @State private var errorMessage: String?

    var body: some View {
        Section(team.name) {
            ForEach(model.fixtureList) { fixture in
                FixtureRowView(fixture: fixture)
            }
        }
        .onAppear {
            Task {
                do {
                    try await model.loadFixtureList(for: team)
                } catch {
                    await MainActor.run {
                        self.errorMessage = "Error loading teams"
                    }
                }
            }
        }
    }
}

struct FixtureSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FixtureSectionView(team: Team.example)
    }
}
