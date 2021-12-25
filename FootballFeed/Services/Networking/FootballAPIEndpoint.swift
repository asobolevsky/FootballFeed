//
//  FootballAPIEndpoint.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

enum FootballAPIEndpoint {
    
    case countries(name: String? = nil, code: String? = nil, search: String? = nil)
    
    var headers: [String: String]? {
        switch self {
        default: return nil
        }
    }
    
    var path: String {
        switch self {
        case .countries:
            return "countries"
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .countries(let name, let code, let search):
            return [
                "name": name,
                "code": code,
                "search": search,
            ].compactMapValues { $0 }
        }
    }
    
    var fullPath: String {
        var fullPath = path
        if let queryString = parameters?.queryString {
            fullPath += "?\(queryString)"
        }
        return fullPath
    }
}
