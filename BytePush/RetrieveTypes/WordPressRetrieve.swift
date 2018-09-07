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

public protocol WordPressRetrieve: Encodable {
    associatedtype BytePushDataType
    var wpEndpointURL: URL { get set }
    init(withEndpointURL wpEndpointURL: URL)
    func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushDataType>) -> Void)
}
