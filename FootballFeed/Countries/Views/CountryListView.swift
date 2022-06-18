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
                List {
                    ForEach(model.countryList) { country in
                        CountryRowView(country: country)
                    }
                }
                .searchable(text: model.searchTextBinding, prompt: "Start entering country name")
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
