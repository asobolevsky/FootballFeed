//
//  CountryListView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import SwiftUI

struct CountryListView: View {
    @StateObject private var model = CountryListModel()
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                ZStack(alignment: .bottom) {
                    List(model.countryList) { country in
                        let isSelected = model.selectedCountries.contains(country)
                        CountryRowView(country: country, isSelected: isSelected)
                            .onTapGesture {
                                model.selectedCountries.toggle(country)
                            }
                    }
                    .searchable(text: $model.searchText, prompt: "Start entering country name")
                    if model.selectedCountries.count > 0 {
                        Button(action: {  }) {
                                Text("Continue")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .foregroundColor(.white)
                        .background(Color.blue)
                    }
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await model.loadCountryList()
                } catch {
                    await MainActor.run {
                        self.errorMessage = "Error loading countries"
                    }
                }
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
