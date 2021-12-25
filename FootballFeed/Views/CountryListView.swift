//
//  CountryListView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import SwiftUI

struct CountryListView: View {
    @ObservedObject var viewModel: CountryListViewModel
    
    var body: some View {
        HStack {
            List(viewModel.countries) { country in
                Text(country.name)
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CountryListViewModel()
        CountryListView(viewModel: viewModel)
    }
}
