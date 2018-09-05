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
    public let id: Int?
    /// The ID of the user object, if author was a user; otherwise, 0.
    public let author: Int?
    /// Email address for the object author.
    public let authorEmail: String?
    /// IP address for the object author.
    public let authorIP: String?
    /// Display name for the object author.
    public let authorName: String?
    /// URL for the object author.
    public let authorURL: URL?
    /// The content for the object.
    public let content: WPContainer?
    /// The date the object was published, in the site's timezone.
    public let date: Date?
    /// The date the object was published, as GMT.
    public let dateGMT: Date?
    /// URL to the object.
    public let link: URL?
    /// The ID for the parent of the object.
    public let parent: Int?
    /// The ID of the associated post object.
    public let post: Int?
    /// State of the object.
    public let status: String?
    /// Type of Comment for the object.
    public let type: String?
    /// Avatar URLs for the object author.
    public let authorAvatarURLs: [String:URL]?
    
    private enum CodingKeys: String, CodingKey {
        case id, author, content, date, link, parent, post, status, type
        case authorEmail = "author_email"
        case authorIP = "author_ip"
        case authorName = "author_name"
        case authorURL = "author_url"
        case dateGMT = "date_gmt"
        case authorAvatarURLs = "author_avatar_urls"
    }
}
