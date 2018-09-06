//
//  BytePushSettingsQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/5/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushSettingsQuery: WordPressQuery {
    /// The blog URL with complete path to the appropriate endpoint.
    public var wpEndpointURL: URL
    
    public init(withEndpointURL wpEndpointURL: URL) {
        self.wpEndpointURL = wpEndpointURL
    }
    
    public func execute(withAuthenticationItem authenticationItem: URLQueryItem? = nil, result: @escaping (WordPressQueryResult<BytePushPostStatus>) -> Void) {
        guard var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false) else {
            result(.failure(WordPressQueryError.couldNotConstructURL))
            return
        }
        if let item = authenticationItem {
            components.queryItems = [item]
        }
        guard let url = components.url else {
            result(.failure(WordPressQueryError.couldNotConstructURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = BytePushUtilities.wpJSONDecoder
                    let requestResult = try decoder.decode([BytePushPostStatus].self, from: data)
                    result(.success(requestResult))
                } catch let err {
                    result(.failure(err))
                }
            }
        }.resume()
    }
}
