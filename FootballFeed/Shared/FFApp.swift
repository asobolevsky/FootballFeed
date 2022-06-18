//
//  FFApp.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

enum FFApp {
    private static var _config: AppConfig?

    static var config: AppConfig {
        if let config = _config {
            return config
        }

        do {
            let configMager = ConfigManager()
            let config = try configMager.loadConfig()
            _config = config
            return config
        } catch {
            fatalError("Could not load app configuration: \(error)")
        }

    }

}
