//
//  Set+Additions.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-18.
//

import Foundation

extension Set {
    mutating func toggle(_ element: Element) {
        if contains(element) {
            remove(element)
        } else {
            insert(element)
        }
    }
}
