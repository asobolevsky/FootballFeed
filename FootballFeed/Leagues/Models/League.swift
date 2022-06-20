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
}
