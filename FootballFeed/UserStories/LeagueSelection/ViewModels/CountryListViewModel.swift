//
//  CountryListViewModel.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import SwiftUI

class CountryListViewModel: ObservableObject {
  
  typealias PriorityFilter = (Country) -> Bool
  
  @Published var countries: [Country] = []
  
  private let topLeaguesCountryNames: [String] = [
    "England", "Spain", "Italy", "France", "Germany"
  ]
  
  private lazy var topLeaguePriorityFilter: PriorityFilter = { [unowned self] country in
    return self.topLeaguesCountryNames.contains(country.name)
  }
  
  private lazy var currentCountryPriorityFilter: PriorityFilter = { [unowned self] country in
    guard let countryCode = Locale.current.regionCode else {
      return false
    }
    
    return countryCode == country.code
  }
  
  private var countryPriorityFilters: [PriorityFilter] {
    return [ topLeaguePriorityFilter, currentCountryPriorityFilter ]
  }
  
  init() {
    fetchCountries()
  }
  
  func fetchCountries() {
    FootballAPIManager.shared.fetch(endpoint: .countries()) { (result: APIResult<[Country]>) in
      switch result {
      case .success(let countries):
        DispatchQueue.main.async {
          self.countries = self.filterCountries(countries)
        }
        
      default: break
      }
    }
  }
  
  // MARK: - Private
  
  private func filterCountries(_ countries: [Country]) -> [Country] {
    var priorityCountries = [Country]()
    var otherCountries = [Country]()
    
    for country in countries {
      if countryPriorityFilters.reduce(false, { $0 || $1(country) }) {
        priorityCountries.append(country)
      } else {
        otherCountries.append(country)
      }
    }
    
    return priorityCountries + otherCountries
  }
}
