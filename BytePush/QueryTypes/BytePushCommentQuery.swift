//
//  BytePushCommentQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushCommentQuery: WordPressQuery {
    enum Orderby: String, Codable {
        case date, id, include, post, parent, type
        case dateGMT = "date_gmt"
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
    /// Limit response to comments published after a given date.
    var after: Date?
    /// Limit result set to comments assigned to specific user IDs. Requires authorization.
    var author: [Int]?
    /// Ensure result set excludes comments assigned to specific user IDs. Requires authorization.
    var authorExclude: [Int]?
    /// Limit result set to that from a specific author email. Requires authorization.
    var authorEmail: [String]?
    /// Limit response to comments published before a given ISO8601 compliant date.
    var before: Date?
    /// Ensure result set excludes specific IDs.
    var exclude: [Int]?
    /// Limit result set to specific IDs.
    var include: [Int]?
    /// Offset the result set by a specific number of items.
    var offset: Int?
    /// Order sort attribute ascending or descending.
    var order: Order?
    /// Sort collection by object attribute.
    var orderby: Orderby?
    /// Limit result set to comments of specific parent IDs.
    var parent: [Int]?
    /// Ensure result set excludes specific parent IDs.
    var parentExclude: [Int]?
    /// Limit result set to comments assigned to specific post IDs.
    var post: [Int]?
    /// Limit result set to comments assigned a specific status. Requires authorization.
    var status: String?
    /// Limit result set to comments assigned a specific type. Requires authorization.
    var type: String?
    /// The password for the post if it is password protected.
    var password: String?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, after, author, before, exclude, include, offset
        case order, orderby, parent, post, status, type, password
        case perPage = "per_page"
        case authorExclude = "author_exclude"
        case authorEmail = "author_email"
        case parentExclude = "parent_exclude"
    }
    
    public init(withEndpointURL wpEndpointURL: URL) {
        self.wpEndpointURL = wpEndpointURL
    }
    
    public func execute(withAuthenticationItem authenticationItem: URLQueryItem? = nil, result: @escaping (WordPressQueryResult<BytePushComment>) -> Void) {
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
                    let requestResult = try decoder.decode([BytePushComment].self, from: data)
                    result(.success(requestResult))
                } catch let err {
                    result(.failure(err))
                }
            }
        }.resume()
    }
}
