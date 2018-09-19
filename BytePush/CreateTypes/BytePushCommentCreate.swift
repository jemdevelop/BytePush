//
//  BytePushCommentCreate.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/19/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public class BytePushCommentCreate {
    public let wpEndpointURL: URL
    /// The ID of the user object, if author was a user.
    public var author: Int?
    /// Email address for the object author.
    public var authorEmail: String
    /// IP address for the object author.
    public var authorIP: String?
    /// Display name for the object author.
    public var authorName: String
    /// URL for the object author.
    public var authorURL: URL?
    /// User agent for the object author.
    public var authorUserAgent: String?
    /// The content for the object.
    public var content: WPContent
    /// The date the object was published, in the site's timezone.
    public var date: Date?
    /// The date the object was published, as GMT.
    public var dateGMT: Date?
    /// The ID for the parent of the object.
    public var parent: Int?
    /// The ID of the associated post object.
    public var post: Int
    /// State of the object.
    public var status: String?
    
    public init(withEndpointURL wpEndpointURL: URL, authorName: String, authorEmail: String, content: WPContent, post: Int) {
        self.wpEndpointURL = wpEndpointURL
        self.authorName = authorName
        self.authorEmail = authorEmail
        self.content = content
        self.post = post
    }
    
    private enum CodingKeys: String, CodingKey {
        case author, content, date, parent, post, status
        case authorEmail = "author_email"
        case authorIP = "author_ip"
        case authorName = "author_name"
        case authorURL = "author_url"
        case authorUserAgent = "author_user_agent"
        case dateGMT = "date_gmt"
    }
}
