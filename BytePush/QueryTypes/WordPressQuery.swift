//
//  WordPressQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public enum WordPressQueryResult<BytePushDataType> {
    case success([BytePushDataType])
    case failure(Error)
}

public enum WordPressQueryError: Error {
    case couldNotConstructURL
}

public enum Context: String, Codable {
    case view, embed, edit
}

public enum Order: String, Codable {
    case ascending = "asc"
    case descending = "desc"
}

public protocol WordPressQuery: Encodable {
    associatedtype BytePushDataType
    var wpEndpointURL: URL { get set }
    init(withEndpointURL wpEndpointURL: URL)
    func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressQueryResult<BytePushDataType>) -> Void)
}

extension WordPressQuery {
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
    
    /// The complete URL for the query.
    public var queryURL: URL? {
        var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        return components?.url
    }
}
