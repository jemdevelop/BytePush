//
//  BytePushCategoryQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushCategoryQuery: WordPressQuery {
    var context: Context?
    var page: Int?
    var perPage: Int?
    var search: String?
    var exclude: [Int]?
    var include: [Int]?
    var order: Order?
    var orderby: OrderBy?
    var hideEmpty: Bool?
    var parent: Int?
    var post: Int?
    var slug: [String]?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, exclude, include, order, orderby, parent, post, slug
        case perPage = "per_page"
        case hideEmpty = "hide_empty"
    }
}
