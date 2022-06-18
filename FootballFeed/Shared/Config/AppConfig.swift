//
//  AppConfig.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

enum AppEnvironment: String, Decodable {
    case debug
    case prod
}

struct AppConfig: Decodable {
    let environment: AppEnvironment
    let footballApiBaseUrl: String
    let apiKey: String
}
