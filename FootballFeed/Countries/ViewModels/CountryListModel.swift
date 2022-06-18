//
//  CountryListModel.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Combine
import SwiftUI

class CountryListModel: ObservableObject {
    private let networkManager: NetworkManager
    private var cancellables = Set<AnyCancellable>()

    private var unfilteredCountryList: [Country] = []
    @Published var countryList: [Country] = []

    var searchText = "" {
        didSet {
            filterContries(with: searchText.lowercased())
        }
    }

    @Published var selectedCountries: Set<Country> = []

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
                .filter { country in
                    country.name.lowercased().contains(searchText) || (country.code?.lowercased().contains(searchText) ?? false)
                }
        }
    }
}
