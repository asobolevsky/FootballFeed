//
//  SelectCountriesView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-26.
//

import SwiftUI

struct SelectCountriesView: View {
  @State var selectedCountry: Country?
  @State var showSelectCountriesAlert: Bool = false
  
  var body: some View {
    VStack {
      if let selectedCountry = selectedCountry {
        NavigationLink(
          destination: SelectLeaguesView(selectedCountry: selectedCountry),
          isActive: .constant(true)
        ) {}
      }
      
      CountryListView(selectedCountry: $selectedCountry,
                      viewModel: CountryListViewModel())
    }
    .navigationTitle(Text("Select Country"))
    .onAppear {
      selectedCountry = nil
    }
  }
  
  private func validateAnyCountriesAreSelected() -> Bool {
    return selectedCountry != nil
  }
}

struct SelectCountriesView_Previews: PreviewProvider {
  static var previews: some View {
    SelectCountriesView()
  }
}
