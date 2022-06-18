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

    private var searchText = CurrentValueSubject<String, Never>("")
    lazy var searchTextBinding = {
        Binding<String>(
            get: {
                return self.searchText.value
            },
            set: {
                self.searchText.send($0)
            })
    }()

    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager

        searchText
            .sink { text in
                self.filterContries(with: text.lowercased())
            }
            .store(in: &cancellables)
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
