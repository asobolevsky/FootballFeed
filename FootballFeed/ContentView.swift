//
//  ContentView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CountryListView(viewModel: CountryListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
