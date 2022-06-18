//
//  CountryListResponse.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

struct CountryListResponse: Decodable {
    let results: Int
    let response: [Country]
}
