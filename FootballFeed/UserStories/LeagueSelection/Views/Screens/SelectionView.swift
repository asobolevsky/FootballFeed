//
//  SelectionView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-16.
//

import SwiftUI

struct SelectionView: View {
  var body: some View {
    NavigationView {
      SelectCountriesView()
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

struct SelectionView_Previews: PreviewProvider {
  static var previews: some View {
    SelectionView()
  }
}
