//
//  ConfigManager.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-17.
//

import Foundation

enum ConfigManagerError: Error {
    case couldNotLoadConfigFile
    case couldNotFindConfigForEnvironment(_ environment: AppEnvironment)
    case couldNotParseConfigFile
    case couldNotDecodeConfigFile
}

class ConfigManager {

    func loadConfig() throws -> AppConfig {
        guard let configFilePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            throw ConfigManagerError.couldNotLoadConfigFile
        }

        let environment: AppEnvironment = .debug
        guard
            let environments = NSDictionary(contentsOfFile: configFilePath) as? [String: AnyObject],
            let environementConfig = environments[environment.rawValue] as? [String: AnyObject]
        else {
            throw ConfigManagerError.couldNotFindConfigForEnvironment(environment)
        }


        guard let configData = environementConfig.jsonData else {
            throw ConfigManagerError.couldNotParseConfigFile
        }

        do {
            return try JSONDecoder.api.decode(AppConfig.self, from: configData)
        } catch {
            throw ConfigManagerError.couldNotDecodeConfigFile
        }
    }
}
