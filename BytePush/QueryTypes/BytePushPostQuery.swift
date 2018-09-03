//
//  BytePushPostRequest.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPostQuery: WordPressQuery {
    enum OrderBy: String, Codable {
        case author, date, id, include, modified, parent, relevance
        case slug, title
    }
    var queryURL: URL
    /// Scope under which the request is made; determines fields present in response.
    var context: Context?
    /// Current page of the collection.
    var page: Int?
    /// Maximum number of items to be returned in result set.
    var perPage: Int?
    /// Limit results to those matching a string.
    var search: String?
    /// Limit response to posts published after a given date.
    var after: Date?
    /// Limit result set to posts assigned to specific authors.
    var author: [Int]?
    /// Ensure result set excludes posts assigned to specific authors.
    var authorExclude: [Int]?
    /// Limit response to posts published before a given date.
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
    var orderby: OrderBy?
    /// Limit result set to posts with one or more specific slugs.
    var slug: [String]?
    /// Limit result set to posts assigned one or more statuses.
    var status: [String]?
    /// Limit result set to all items that have the specified term assigned in the categories taxonomy.
    var categories: [Int]?
    /// Limit result set to all items except those that have the specified term assigned in the categories taxonomy.
    var categoriesExclude: [Int]?
    /// Limit result set to all items that have the specified term assigned in the tags taxonomy.
    var tags: [Int]?
    /// Limit result set to all items except those that have the specified term assigned in the tags taxonomy.
    var tagsExclude: [Int]?
    /// Limit result set to items that are sticky.
    var sticky: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case context, page, search, after, author, before, exclude, include, offset
        case order, orderby, slug, status, categories, tags, sticky
        case perPage = "per_page"
        case authorExclude = "author_exclude"
        case categoriesExclude = "categories_exclude"
        case tagsExclude = "tags_exclude"
    }
    
    init(queryURL: URL) {
        self.queryURL = queryURL
    }
    
    func execute(withAuthenticationItem authenticationItem: URLQueryItem? = nil, result: @escaping (WordPressQueryResult<BytePushPost>) -> Void) {
        guard var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: false) else {
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
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    let requestResult = try decoder.decode([BytePushPost].self, from: data)
                    result(.success(requestResult))
                } catch let err {
                    result(.failure(err))
                }
            }
        }.resume()
    }
}
