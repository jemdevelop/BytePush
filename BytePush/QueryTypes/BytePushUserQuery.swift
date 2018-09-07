//
//  BytePushUserQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushUserQuery: WordPressQuery {
    public enum Orderby: String, Codable {
        case id, include, name, slug, email, url
        case registeredDate = "registered_date"
    }
    /// The blog URL with complete path to the appropriate endpoint.
    public let wpEndpointURL: URL
    /// Scope under which the request is made; determines fields present in response.
    public var context: Context?
    /// Current page of the collection.
    public var page: Int?
    /// Maximum number of items to be returned in result set.
    public var perPage: Int?
    /// Limit results to those matching a string.
    public var search: String?
    /// Ensure result set excludes specific IDs.
    public var exclude: [Int]?
    /// Limit result set to specific IDs.
    public var include: [Int]?
    /// Offset the result set by a specific number of items.
    public var offset: Int?
    /// Order sort attribute ascending or descending.
    public var order: Order?
    /// Sort collection by object attribute.
    public var orderby: Orderby?
    /// Limit result set to users with one or more specific slugs.
    public var slug: [String]?
    /// Limit result set to users matching at least one specific role provided.
    public var roles: [String]?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, exclude, include, offset, order, orderby
        case slug, roles
        case perPage = "per_page"
    }
    
    public init(withEndpointURL wpEndpointURL: URL) {
        self.wpEndpointURL = wpEndpointURL
    }
    
    public func execute(withAuthenticationItem authenticationItem: URLQueryItem? = nil, result: @escaping (WordPressQueryResult<BytePushUser>) -> Void) {
        guard var components = URLComponents(url: wpEndpointURL, resolvingAgainstBaseURL: false) else {
            result(.failure(WordPressQueryError.couldNotConstructURL))
            return
        }
        components.queryItems = queryItems
        if let item = authenticationItem {
            components.queryItems?.append(item)
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
                    let requestResult = try decoder.decode([BytePushUser].self, from: data)
                    result(.success(requestResult))
                } catch let err {
                    result(.failure(err))
                }
            }
        }.resume()
    }
}
