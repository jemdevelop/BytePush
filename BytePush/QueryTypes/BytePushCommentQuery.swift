//
//  BytePushCommentQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushCommentQuery: WordPressQuery {
    enum Orderby: String, Codable {
        case date, id, include, post, parent, type
        case dateGMT = "date_gmt"
    }
    var context: Context?
    var page: Int?
    var perPage: Int?
    var search: String?
    var after: Date?
    var author: [Int]?
    var authorExclude: [Int]?
    var authorEmail: [String]?
    var before: Date?
    var exclude: [Int]?
    var include: [Int]?
    var offset: Int?
    var order: Order?
    var orderby: Orderby?
    var parent: [Int]?
    var parentExclude: [Int]?
    var post: [Int]?
    var status: String?
    var type: String?
    var password: String?
}
