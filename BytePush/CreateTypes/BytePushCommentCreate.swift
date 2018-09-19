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
    public var author: Int?
    public var authorEmail: String
    public var authorIP: String?
    public var authorName: String
    public var authorURL: URL?
    public var authorUserAgent: String?
    public var content: WPContent
    public var date: Date?
    public var dateGMT: Date?
    public var parent: Int?
    public var post: Int
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
