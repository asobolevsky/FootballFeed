//
//  SelectTeamsView.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2022-01-21.
//

import SwiftUI

struct SelectTeamsView: View {
  let selectedLeague: League
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct SelectTeamsView_Previews: PreviewProvider {
  static var previews: some View {
    SelectTeamsView(selectedLeague: League.previewLeague)
  }
}
