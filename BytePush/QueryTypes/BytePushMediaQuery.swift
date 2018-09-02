//
//  BytePushMediaQuery.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushMediaQuery: WordPressQuery {
    enum Orderby: String, Codable {
        case author, date, id, include, modified, parent, relevance, slug, title
    }
    enum MediaType: String, Codable {
        case image, video, audio, application
    }
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
    var orderby: Orderby?
    var parent: [Int]?
    var parentExclude: [Int]?
    var slug: [String]?
    var status: [String]?
    var mediaType: MediaType?
    var mimeType: String?
    
    enum CodingKeys: String, CodingKey {
        case context, page, search, after, author, before, exclude, include
        case offset, order, orderby, parent, slug, status
        case perPage = "per_page"
        case authorExclude = "author_exclude"
        case parentExclude = "parent_exclude"
        case mediaType = "media_type"
        case mimeType = "mime_type"
    }
}
