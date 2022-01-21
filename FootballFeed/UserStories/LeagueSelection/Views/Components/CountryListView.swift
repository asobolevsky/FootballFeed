//
//  CountryListView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import SwiftUI

struct CountryListView: View {
  @Binding var selectedCountry: Country?
  @StateObject var viewModel: CountryListViewModel
  @State private var searchString: String = ""
  
  var body: some View {
    List(viewModel.countries,
         id: \.self,
         selection: $selectedCountry) { country in
      HStack {
        Text(country.name)
        Spacer()
      }
      .contentShape(Rectangle())
      .onTapGesture {
        selectedCountry = country
      }
    }.searchable(text: $searchString)
      .onChange(of: searchString) {
        if validateSearchString(searchString) {
          viewModel.fetchCountries(search: $0)
        }
      }
  }
  
  private func validateSearchString(_ searchString: String) -> Bool {
    return searchString.count >= 3
  }
}

struct CountryListView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = CountryListViewModel()
    
    CountryListView(selectedCountry: .constant(Country.previewCountry),
                    viewModel: viewModel)
  }
}
