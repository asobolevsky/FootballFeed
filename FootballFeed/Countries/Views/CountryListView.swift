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
        List {
            ForEach(model.countryList) { country in
                CountryRowView(country: country)
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
