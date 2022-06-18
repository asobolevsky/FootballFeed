//
//  ContentView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CountryListView()
                .navigationTitle("Select Countries")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
