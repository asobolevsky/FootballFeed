//
//  APIResource.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

protocol APIResource {
    var path: String { get }
    var query: [String: String] { get }
}

extension APIResource {
    var query: [String: String] {
        [:]
    }
}
