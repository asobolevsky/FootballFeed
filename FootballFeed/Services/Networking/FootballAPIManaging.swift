//
//  FootballAPIManaging.swift
//  FootballFeed
//
//  Created by Алексей Соболевский on 2021-12-25.
//

import Foundation

enum APIResult<T> {
    case success(T)
    case failure(Error)
}

protocol FootballAPIManaging {
    
    func fetch<T: Decodable>(endpoint: FootballAPIEndpoint, completion: @escaping (APIResult<T>) -> ())
    
}
