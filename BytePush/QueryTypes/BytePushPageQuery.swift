//
//  BytePushPageQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushPageQuery: WordPressQuery {
    enum OrderBy: String, Codable {
        case author, date, id, include, modified, parent, relevance
        case slug, title
    }
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
    /// Limit result set to posts with a specific menu_order value.
    var menuOrder: Int?
    /// Offset the result set by a specific number of items.
    var offset: Int?
    /// Order sort attribute ascending or descending.
    var order: Order?
    /// Sort collection by object attribute.
    var orderby: OrderBy?
    /// Limit result set to items with particular parent IDs.
    var parent: [Int]?
    /// Limit result set to all items except those of a particular parent ID.
    var parentExclude: [Int]?
    /// Limit result set to posts with one or more specific slugs.
    var slug: [String]?
    /// Limit result set to posts assigned one or more statuses.
    var status: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case context, page, search, after, author, before, exclude, include, offset
        case order, orderby, parent, slug, status
        case perPage = "per_page"
        case authorExclude = "author_exclude"
        case menuOrder = "menu_order"
        case parentExclude = "parent_exclude"
    }
}