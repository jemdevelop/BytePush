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
    init(withEndpointURL wpEndpointURL: URL, getID id: Int)
    var id: Int { get }
    func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushDataType>) -> Void)
}

extension WordPressRetrieve {
    /// The complete URL for the query.
    public var queryURL: URL? {
        var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false)
        components?.path.append(String(id))
        components?.queryItems = queryItems
        return components?.url
    }
}
