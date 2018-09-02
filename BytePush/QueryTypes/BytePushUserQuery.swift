//
//  BytePushUserQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushUserQuery: WordPressQuery {
    enum Orderby: String, Codable {
        case id, include, name, slug, email, url
        case registeredDate = "registered_date"
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
    /// Offset the result set by a specific number of items.
    var offset: Int?
    /// Order sort attribute ascending or descending.
    var order: Order?
    /// Sort collection by object attribute.
    var orderby: Orderby?
    /// Limit result set to users with one or more specific slugs.
    var slug: [String]?
    /// Limit result set to users matching at least one specific role provided.
    var roles: [String]?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, exclude, include, offset, order, orderby
        case slug, roles
        case perPage = "per_page"
    }
}
