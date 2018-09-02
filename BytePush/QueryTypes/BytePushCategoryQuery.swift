//
//  BytePushCategoryQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushCategoryQuery: WordPressQuery {
    enum OrderBy: String, Codable {
        case id, include, name, slug, description, count
        case termGroup = "term_group"
    }
    var endpoint: WordPressEndpoint {
        return .categories
    }
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
}
