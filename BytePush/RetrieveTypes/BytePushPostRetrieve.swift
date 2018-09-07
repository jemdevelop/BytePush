//
//  WordPressPostRetrieve.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/7/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPostRetrieve: WordPressRetrieve {
    /// The blog URL with complete path to the appropriate endpoint.
    public var wpEndpointURL: URL
    public var id: Int
    public var context: Context?
    public var password: String?
    
    public init(withEndpointURL wpEndpointURL: URL, getID id: Int) {
        self.wpEndpointURL = wpEndpointURL
        self.id = id
    }
    
    public func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushPost>) -> Void) {
        
    }
}
