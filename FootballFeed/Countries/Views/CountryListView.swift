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
                        NavigationLink {
                            LeagueListView(country: country)
                        } label: {
                            CountryRowView(country: country)
                        }
                    }
                    .searchable(text: $model.searchText, prompt: "Start entering country name")
                }
            }
        }
        .navigationTitle("Select Countries")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            model.searchText = ""
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
