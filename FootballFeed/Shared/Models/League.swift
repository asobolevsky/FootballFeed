//
//  League.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

struct League: Codable {
    let id: Int
    let name: String
    let type: String
    let logo: String?
}

extension League: Identifiable, Hashable {
    var logoUrl: URL? {
        guard let logo = logo else {
            return nil
        }
        return URL(string: logo)
    }
}
