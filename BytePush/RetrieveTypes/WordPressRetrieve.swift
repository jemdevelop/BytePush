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

public protocol WordPressRetrieve: WordPressGet {
    associatedtype BytePushDataType
    var idString: String { get }
    func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushDataType>) -> Void)
}

extension WordPressRetrieve {
    /// The complete URL for the query.
    public var getURL: URL? {
        var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false)
        components?.path.append(idString)
        components?.queryItems = queryItems
        return components?.url
    }
}
