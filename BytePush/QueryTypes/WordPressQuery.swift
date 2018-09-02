//
//  WordPressQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

enum WordPressQueryResult<BytePushDataType> {
    case success([BytePushDataType])
    case failure(Error)
}

protocol WordPressQuery: Encodable {
    associatedtype BytePushDataType
    var queryURL: URL { get set }
    func execute(result: @escaping (WordPressQueryResult<BytePushDataType>) -> Void)
}

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
