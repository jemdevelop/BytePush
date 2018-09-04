//
//  BytePushCategoryQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushCategoryQuery: WordPressQuery {
    enum OrderBy: String, Codable {
        case id, include, name, slug, description, count
        case termGroup = "term_group"
    }
    public var wpEndpointURL: URL
    /// Scope under which the request is made; determines fields present in response.
    var context: Context?
    /// Current page of the collection.
    var page: Int?
    /// Maximum number of items to be returned in result set.
    var perPage: Int?
    /// Limit results to those matching a string.
    var search: String?
    /// Ensure result set excludes specific IDs.
    var exclude: [Int]?
    /// Limit result set to specific IDs.
    var include: [Int]?
    /// Order sort attribute ascending or descending.
    var order: Order?
    /// Sort collection by term attribute.
    var orderby: OrderBy?
    /// Whether to hide terms not assigned to any posts.
    var hideEmpty: Bool?
    /// Limit result set to terms assigned to a specific parent.
    var parent: Int?
    /// Limit result set to terms assigned to a specific post.
    var post: Int?
    /// Limit result set to terms with one or more specific slugs.
    var slug: [String]?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, exclude, include, order, orderby, parent, post, slug
        case perPage = "per_page"
        case hideEmpty = "hide_empty"
    }
    
    public init(withEndpointURL wpEndpointURL: URL) {
        self.wpEndpointURL = wpEndpointURL
    }
    
    public func execute(withAuthenticationItem authenticationItem: URLQueryItem? = nil, result: @escaping (WordPressQueryResult<BytePushCategory>) -> Void) {
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
                    let requestResult = try decoder.decode([BytePushCategory].self, from: data)
                    result(.success(requestResult))
                } catch let err {
                    result(.failure(err))
                }
            }
        }.resume()
    }
}
