//
//  SelectLeaguesView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import SwiftUI

struct SelectLeaguesView: View {
  @Binding var selectedCountries: Set<Country>
  @State var selectedLeagues: Set<Country> = []
  @State var showLeaguesView: Bool = false
  
  var body: some View {
    Text(selectedCountries.map { $0.name }.joined(separator: ", "))
  }
}

struct SelectLeaguesView_Previews: PreviewProvider {
  static var previews: some View {
    SelectLeaguesView(selectedCountries: .constant([]))
  }
}
