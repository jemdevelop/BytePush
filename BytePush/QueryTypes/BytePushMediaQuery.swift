//
//  BytePushMediaQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushMediaQuery: WordPressQuery {
    public enum Orderby: String, Codable {
        case author, date, id, include, modified, parent, relevance, slug, title
    }
    public enum MediaType: String, Codable {
        case image, video, audio, application
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
    /// Limit response to posts published after a given date.
    public var after: Date?
    /// Limit result set to posts assigned to specific authors.
    public var author: [Int]?
    /// Ensure result set excludes posts assigned to specific authors.
    public var authorExclude: [Int]?
    /// Limit response to posts published before a given date.
    public var before: Date?
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
    /// Limit result set to items with particular parent IDs.
    public var parent: [Int]?
    /// Limit result set to all items except those of a particular parent ID.
    public var parentExclude: [Int]?
    /// Limit result set to posts with one or more specific slugs.
    public var slug: [String]?
    /// Limit result set to posts assigned one or more statuses.
    public var status: [String]?
    /// Limit result set to attachments of a particular media type.
    public var mediaType: MediaType?
    /// Limit result set to attachments of a particular MIME type.
    public var mimeType: String?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, after, author, before, exclude, include
        case offset, order, orderby, parent, slug, status
        case perPage = "per_page"
        case authorExclude = "author_exclude"
        case parentExclude = "parent_exclude"
        case mediaType = "media_type"
        case mimeType = "mime_type"
    }
    
    public init(withEndpointURL wpEndpointURL: URL) {
        self.wpEndpointURL = wpEndpointURL
    }
    
    public func execute(withAuthenticationItem authenticationItem: URLQueryItem? = nil, result: @escaping (WordPressQueryResult<BytePushMedia>) -> Void) {
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
                    let requestResult = try decoder.decode([BytePushMedia].self, from: data)
                    result(.success(requestResult))
                } catch let err {
                    result(.failure(err))
                }
            }
        }.resume()
    }
}
