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

public protocol WordPressQuery: WordPressGet {
    associatedtype BytePushDataType
    init(withEndpointURL wpEndpointURL: URL)
    func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressQueryResult<BytePushDataType>) -> Void)
}

extension WordPressQuery {
    /// The complete URL for the query.
    public var queryURL: URL? {
        var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems
        return components?.url
    }
}
