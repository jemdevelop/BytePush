//
//  BytePushComment.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushComment: Codable {
    /// Unique identifier for the object.
    let id: Int
    /// The ID of the user object, if author was a user; otherwise, 0.
    let author: Int
    /// Display name for the object author.
    let authorName: String
    /// URL for the object author.
    let authorURL: URL?
    /// The content for the object.
    let content: Rendered
    /// The date the object was published, as GMT.
    let date: Date
    /// URL to the object.
    let link: URL
    /// The ID for the parent of the object.
    let parent: Int
    /// The ID of the associated post object.
    let post: Int
    /// State of the object.
    let status: String
    /// Type of Comment for the object.
    let type: String
    /// Avatar URLs for the object author.
    let authorAvatarURLs: [String:URL]
    
    enum CodingKeys: String, CodingKey {
        case id, author, conent, link, parent, post, status, type
        case authorName = "author_name"
        case authorURL = "author_URL"
        case authorAvatarURLs = "author_avatar_urls"
        case date = "date_gmt"
    }
}
