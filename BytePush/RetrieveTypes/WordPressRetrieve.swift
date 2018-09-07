//
//  WordPressRetrieve.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/6/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public enum WordPressRetrieveResult<BytePushDataType> {
    case success(BytePushDataType)
    case failure(Error)
}

public protocol WordPressRetrieve: WordPressOperation {
    associatedtype BytePushDataType
    var idString: String { get }
    func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushDataType>) -> Void)
}

extension WordPressRetrieve {
    /// The complete URL for the query.
    public var queryURL: URL? {
        var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false)
        components?.path.append(idString)
        components?.queryItems = queryItems
        return components?.url
    }
}
