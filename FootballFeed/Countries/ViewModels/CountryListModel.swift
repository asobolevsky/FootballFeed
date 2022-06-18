//
//  CountryListModel.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Combine

class CountryListModel: ObservableObject {
    private let networkManager: NetworkManager

    @Published var countryList: [Country] = []

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    func loadCountryList() async throws {
        let response: CountryListResponse = try await networkManager.performRequest(for: CountriesAPI.countries)
        countryList = response.response
    }
}
