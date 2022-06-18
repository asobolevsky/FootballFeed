//
//  CountriesAPI.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

enum CountriesAPI: APIResource {
    case countries

    var path: String {
        switch self {
        case .countries: return "/countries"
        }
    }
}
