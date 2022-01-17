//
//  SelectCountriesView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-26.
//

import SwiftUI

struct SelectCountriesView: View {
  @State var selectedCountries: Set<Country> = []
  @State var showLeaguesView: Bool = false
  
  var body: some View {
    NavigationView {
      VStack {
        NavigationLink(
          destination: SelectLeaguesView(selectedCountries: $selectedCountries),
          isActive: $showLeaguesView
        ) {}
        
        CountryListView(selectedCountries: $selectedCountries,
                        viewModel: CountryListViewModel())
      }
      .navigationTitle(Text("Select Countries"))
      .toolbar {
        Button("Next") {
          showLeaguesView = true
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

struct SelectCountriesView_Previews: PreviewProvider {
  static var previews: some View {
    SelectCountriesView()
  }
}
