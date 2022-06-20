//
//  CountryListModel.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Combine

class CountryListViewModel: ObservableObject {
    private let networkManager: APIDataProvider

    private let filterCountryNames = [ "England", "Spain", "Germany", "France", "Italy", "Portugal", "Belgium" ]

    private var unfilteredCountryList: [Country] = []
    @Published var countryList: [Country] = []

    var searchText = "" {
        didSet {
            filterContries(with: searchText.lowercased())
        }
    }

    init(networkManager: APIDataProvider = NetworkMock()) {
        self.networkManager = networkManager
    }

    func loadCountryList() async throws {
        let response: CountryListResponse = try await networkManager.performRequest(for: CountriesAPI.countries)
        unfilteredCountryList = response.response
            .filter { filterCountryNames.contains($0.name) }
        await MainActor.run {
            self.countryList = unfilteredCountryList
        }
    }

    private func filterContries(with searchText: String) {
        if searchText.isEmpty {
            countryList = unfilteredCountryList
        } else {
            countryList = unfilteredCountryList
                .filter {
                    $0.name.lowercased().contains(searchText) || ($0.code?.lowercased().contains(searchText) ?? false)
                }
        }
    }
}
