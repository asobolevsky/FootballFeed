//
//  TeamListMode.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Combine

class TeamListViewModel: ObservableObject {
    private let networkManager: NetworkManager

    private var unfilteredTeamList: [Team] = []
    @Published var teamList: [Team] = []

    var searchText = "" {
        didSet {
            filterTeams(with: searchText.lowercased())
        }
    }

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    func loadTeamList(for league: League) async throws {
        let response: TeamListResponse = try await networkManager.performRequest(for: TeamsAPI.teams(league: league.id, season: 2022))
        unfilteredTeamList = response.response.map { $0.team }
        await MainActor.run {
            self.teamList = unfilteredTeamList
        }
    }

    private func filterTeams(with searchText: String) {
        if searchText.isEmpty {
            teamList = unfilteredTeamList
        } else {
            teamList = unfilteredTeamList
                .filter {
                    $0.name.lowercased().contains(searchText) || ($0.code.lowercased().contains(searchText) ?? false)
                }
        }
    }
}
