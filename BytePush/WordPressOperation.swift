//
//  WordPressOperation.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/7/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public protocol WordPressOperation: Encodable {
    var wpEndpointURL: URL { get }
    var queryURL: URL? { get }
}

extension WordPressOperation {
    /// An array of query items representing the query.
    var queryItems: [URLQueryItem]? {
        let encoder = JSONEncoder()
        let dateFormatter = BytePushUtilities.wpDateFormatter
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        guard
            let json = try? encoder.encode(self),
            let serialized = try? JSONSerialization.jsonObject(with: json, options: []),
            let dict = serialized as? [String:Any]
            else {
                return nil
        }
        return dict.map {
            if let array = $0.value as? [Any] {
                // Arrays must be converted to comma-separated value parameters
                let newValue = array.map { "\($0)" }.joined(separator: ",")
                return URLQueryItem(name: $0.key, value: newValue)
            } else {
                return URLQueryItem(name: $0.key, value: "\($0.value)")
            }
        }
    }
}
