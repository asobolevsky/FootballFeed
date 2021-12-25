//
//  CountryListViewModel.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import SwiftUI
import Combine

class CountryListViewModel: ObservableObject {
    
    @Published var countries: [Country] = []
    
    init() {
        fetchCountries()
    }
    
    func fetchCountries() {
        FootballAPIManager.shared.fetch(endpoint: .countries()) { (result: APIResult<[Country]>) in
            switch result {
            case .success(let countries):
                DispatchQueue.main.async {
                    self.countries = countries
                }

            default: break
            }
        }
    }
}
