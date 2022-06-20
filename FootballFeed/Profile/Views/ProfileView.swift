//
//  ProfileView.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("selectedTeams") var selectedTeams: Set<Team> = []

    var body: some View {
        List(Array(selectedTeams)) { team in
            Text(team.name)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
