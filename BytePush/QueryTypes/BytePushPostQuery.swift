//
//  BytePushPostRequest.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushPostQuery: WordPressQuery {
    /// Scope under which the request is made; determines fields present in response.
    var context: Context?
    var page: Int?
    var perPage: Int?
    var search: String?
    var after: Date?
    var author: [Int]?
    var authorExclude: [Int]?
    var before: Date?
    var exclude: [Int]?
    var include: [Int]?
    var offset: Int?
    var order: Order?
    var orderby: OrderBy?
    var slug: String?
    var status: String?
    var categories: [Int]?
    var categoriesExclude: [Int]?
    var tags: [Int]?
    var tagsExclude: [Int]?
    var sticky: Bool?
}
