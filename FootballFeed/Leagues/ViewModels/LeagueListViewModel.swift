//
//  LeagueListViewModel.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-18.
//

import Foundation

class LeagueListViewModel: ObservableObject {
    private let networkManager: NetworkManager
    private var unfilteredLeagueList: [League] = []
    @Published var leagueList: [League] = []

    var searchText = "" {
        didSet {
            filterLeagues(with: searchText.lowercased())
        }
    }

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    func loadLeagueList(for country: Country) async throws {
        let response: LeagueListResponse = try await networkManager.performRequest(for: LeaguesAPI.leagues(country: country.name))
        unfilteredLeagueList = response.response.map { $0.league }
        await MainActor.run {
            self.leagueList = unfilteredLeagueList
        }
    }

    private func filterLeagues(with searchText: String) {
        if searchText.isEmpty {
            leagueList = unfilteredLeagueList
        } else {
            leagueList = unfilteredLeagueList
                .filter { $0.name.lowercased().contains(searchText) }
        }
    }

}
