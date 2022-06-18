//
//  CountryRowView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country

    var body: some View {
        Text(country.name)
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country.example)
    }
}
