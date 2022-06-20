//
//  CountryListModel.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Combine

class CountryListViewModel: ObservableObject {
    private let networkManager: NetworkManager

    private var unfilteredCountryList: [Country] = []
    @Published var countryList: [Country] = []

    var searchText = "" {
        didSet {
            filterContries(with: searchText.lowercased())
        }
    }

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    func loadCountryList() async throws {
        let response: CountryListResponse = try await networkManager.performRequest(for: CountriesAPI.countries)
        unfilteredCountryList = response.response
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