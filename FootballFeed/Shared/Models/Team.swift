//
//  Team.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

struct Team: Codable {
    let id: Int
    let name: String
    let code: String?
    let country: String?
    let logo: String?
}

extension Team: Identifiable, Hashable {
    var logoUrl: URL? {
        guard let logo = logo else {
            return nil
        }
        return URL(string: logo)
    }
}
