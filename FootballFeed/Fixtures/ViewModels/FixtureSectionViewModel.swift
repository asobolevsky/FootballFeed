//
//  FixtureSectionViewModel.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Combine

class FixtureSectionViewModel: ObservableObject {
    private let networkManager: APIDataProvider

    @Published var fixtureList: [Fixture] = []

    init(networkManager: APIDataProvider = NetworkMock()) {
        self.networkManager = networkManager
    }

    func loadFixtureList(for team: Team) async throws {
        let resource = FixturesAPI.fixtures(team: team.id, season: 2022)
        let response: FixtureListResponse = try await networkManager.performRequest(for: resource)
        await MainActor.run {
            self.fixtureList = response.response
        }
    }

}
