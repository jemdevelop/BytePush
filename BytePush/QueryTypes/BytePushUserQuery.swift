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
    var context: Context?
    var page: Int?
    var perPage: Int?
    var search: String?
    var exclude: [Int]?
    var include: [Int]?
    var offset: Int?
    var order: Order?
    var orderby: Orderby?
    var slug: [String]?
    var roles: String?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, exclude, include, offset, order, orderby
        case slug, roles
        case perPage = "per_page"
    }
}
