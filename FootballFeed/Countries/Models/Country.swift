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

extension Country: Identifiable, Hashable {
    var id: String {
        return name
    }

    var flagUrl: URL? {
        guard let flag = flag else {
            return nil
        }
        return URL(string: flag)
    }
}
