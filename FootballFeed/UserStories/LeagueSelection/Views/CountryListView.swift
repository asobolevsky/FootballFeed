//
//  CountryListView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import SwiftUI

struct CountryListView: View {
  @Binding var selectedCountries: Set<Country>
  @StateObject var viewModel: CountryListViewModel
  
  var body: some View {
    HStack {
      List(viewModel.countries,
           id: \.self,
           selection: $selectedCountries) { country in
        HStack {
          Text(country.name)
          Spacer()
          if selectedCountries.contains(country) {
            Image(systemName: "checkmark")
              .foregroundColor(.green)
          }
        }
        .contentShape(Rectangle())
        .onTapGesture {
          selectedCountries.toggle(country)
        }
      }
    }
  }
}

struct CountryListView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = CountryListViewModel()
    CountryListView(selectedCountries: .constant(Set<Country>()),
                    viewModel: viewModel)
  }
}
