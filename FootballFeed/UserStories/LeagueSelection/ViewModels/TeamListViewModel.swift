//
//  TeamListViewModel.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import Foundation

class TeamListViewModel: ObservableObject {
  
  @Published var teams: [Team] = []
  private let league: League
  
  init(for league: League) {
    self.league = league
    fetchTeams()
  }
  
  func fetchTeams() {
    let endpoint: FootballAPIEndpoint = .teams(leagueId: league.id, season: 2021)
    FootballAPIManager.shared.fetch(endpoint: endpoint) { (result: APIResult<[TeamsResponseItem]>) in
      switch result {
      case .success(let response):
        DispatchQueue.main.async {
          self.teams = response.map { $0.team }
        }
        
      default: break
      }
    }
  }
  
}
