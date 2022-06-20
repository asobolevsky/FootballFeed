//
//  DateFormatter+Static.swift
//  FootballFeed
//
//  Created by Aleksei Sobolevskii on 2022-06-20.
//

import Foundation

extension DateFormatter {
    static var api: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return df
    }()

    static var ui: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        return df
    }()
}
