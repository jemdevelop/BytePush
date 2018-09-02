//
//  BytePushTagQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushTagQuery: WordPressQuery {
    enum OrderBy: String, Codable {
        case id, include, name, slug, description, count
        case termGroup = "term_group"
    }
    var context: Context?
    var page: Int?
    var perPage: Int?
    var search: String?
    var exclude: [Int]?
    var include: [Int]?
    var offset: Int?
    var order: Order?
    var orderby: OrderBy?
    var hideEmpty: Bool?
    var post: Int?
    var slug: [String]?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, exclude, include, offset, order, orderby
        case post, slug
        case perPage = "per_page"
        case hideEmpty = "hide_empty"
    }
}
