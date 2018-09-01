//
//  WordPressQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

protocol WordPressQuery: Codable { }

extension WordPressQuery {
    var queryItems: [URLQueryItem]? {
        let encoder = JSONEncoder()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        guard
            let json = try? encoder.encode(self),
            let serialized = try? JSONSerialization.jsonObject(with: json, options: []),
            let dict = serialized as? [String:Any]
            else {
                return nil
        }
        return dict.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
    }
}
