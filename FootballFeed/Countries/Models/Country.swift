//
//  Country.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

struct Country: Codable {
    let name: String
    let code: String?
    let flag: String?
}

extension Country: Identifiable {
    var id: String {
        return code ?? name
    }
}
