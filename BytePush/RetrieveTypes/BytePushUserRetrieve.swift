//
//  BytePushUserRetrieve.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/7/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushUserRetrieve: WordPressRetrieve {
    /// The blog URL with complete path to the appropriate endpoint.
    public let wpEndpointURL: URL
    /// Unique identifier for the object.
    public var idString: String {
        return "me"
    }
    /// Scope under which the request is made; determines fields present in response.
    public var context: Context?
    
    public init(withEndpointURL wpEndpointURL: URL, getID id: Int) {
        self.wpEndpointURL = wpEndpointURL
        self.id = id
    }
    
    public func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushMedia>) -> Void) {
        
    }
}
