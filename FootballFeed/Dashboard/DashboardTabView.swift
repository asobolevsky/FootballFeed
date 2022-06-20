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
            FixturesViews()
                .tabItem {
                    Label("Fixtures", systemImage: "calendar")
                }

            CountryListView()
                .tabItem {
                    Label("Select", systemImage: "filemenu.and.selection")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct DashboardTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabView()
    }
}
