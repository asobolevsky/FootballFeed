//
//  CountryRowView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(country.name)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.green)
            }
        }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country.example, isSelected: true)
    }
}
