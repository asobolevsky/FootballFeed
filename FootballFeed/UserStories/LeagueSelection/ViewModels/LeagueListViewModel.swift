//
//  LeagueListViewModel.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import SwiftUI

class LeagueListViewModel: ObservableObject {
   
  @Published var leagues: [League] = []
  private let country: Country
  
  init(for country: Country) {
    self.country = country
    fetchLeagues()
  }
  
  func fetchLeagues() {
    let countryName = country.name
    
    FootballAPIManager.shared.fetch(endpoint: .leagues(country: countryName)) { (result: APIResult<[LeaguesResponseItem]>) in
      switch result {
      case .success(let response):
        DispatchQueue.main.async {
          self.leagues = response.map { $0.league }
        }
        
      default: break
      }
    }
  }
  
}
