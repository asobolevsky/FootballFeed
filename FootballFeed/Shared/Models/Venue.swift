//
//  Venue.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-19.
//

import Foundation

struct Venue: Codable {
    let id: Int
    let name: String
    let address: String
    let city: String
    let image: String?
}

extension Venue: Identifiable, Hashable {
    var imageUrl: URL? {
        guard let image = image else {
            return nil
        }
        return URL(string: image)
    }
}
