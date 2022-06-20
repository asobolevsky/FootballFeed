//
//  DashboardTabView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import SwiftUI

struct DashboardTabView: View {
    var body: some View {
        TabView {
            CountryListView()
                .tabItem {
                    Label("Select", systemImage: "filemenu.and.selection")
                }
        }
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
