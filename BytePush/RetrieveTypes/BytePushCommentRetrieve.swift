//
//  BytePushCommentRetrieve.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/7/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushCommentRetrieve: WordPressRetrieve {
    /// The blog URL with complete path to the appropriate endpoint.
    public let wpEndpointURL: URL
    /// Unique identifier for the object.
    public let id: Int
    public var idString: String {
        return String(id)
    }
    /// Scope under which the request is made; determines fields present in response.
    public var context: Context?
    /// The password for the post if it is password protected.
    public var password: String?
    
    public init(withEndpointURL wpEndpointURL: URL, getID id: Int) {
        self.wpEndpointURL = wpEndpointURL
        self.id = id
    }
    
    private enum CodingKeys: String, CodingKey {
        case context, password
    }
    
    public func execute(withAuthenticationItem item: URLQueryItem?, result: @escaping (WordPressRetrieveResult<BytePushComment>) -> Void) {
        
    }
}
