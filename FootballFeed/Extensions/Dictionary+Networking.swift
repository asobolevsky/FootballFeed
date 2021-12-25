//
//  Dictionary+Networking.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    
    var queryString: String? {
        return self
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
}
