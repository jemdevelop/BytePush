//
//  WordPressPost.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPost {
    enum Status: String {
        case publish = "publish"
        case future = "future"
        case draft = "draft"
        case pending = "pending"
        case priv = "private"
    }
    enum CommentStatus: String {
        case open
        case closed
    }
    enum PingStatus: String {
        case open
        case closed
    }
    enum Format: String {
        case standard
        case aside
        case chat
        case gallery
        case link
        case image
        case quote
        case status
        case video
        case audio
    }
    /// The date the object was published, in the site's timezone.
    var date: Date
    /// The globally unique identifier for the object.
    let guid: String
    /// Unique identifier for the object.
    let id: Int
    /// URL to the object.
    let link: URL
    /// The date the object was last modified, in the site's timezone.
    let modified: Date
    /// A named status for the object.
    var status: Status
    /// Type of Post for the object.
    let type: String
    /// The title for the object.
    var title: String
    /// The content for the object.
    var content: (rendered: String, protected: Bool)
    /// The ID for the author of the object.
    var author: Int
    /// The excerpt for the object.
    var excerpt: (rendered: String, protected: Bool)
    /// The ID of the featured media for the object.
    var featuredMedia: Int
    /// Whether or not comments are open on the object.
    var commentStatus: CommentStatus
    /// Whether or not the object can be pinged.
    var pingStatus: PingStatus
    /// The format for the object.
    var format: Format
    /// Meta fields.
    var meta: [String] // YES?
    /// Whether or not the object should be treated as sticky.
    var sticky: Bool
    /// The theme file to use to display the object.
    var template: String
    /// The terms assigned to the object in the category taxonomy.
    var categories: [Int]
    /// The terms assigned to the object in the post_tag taxonomy.
    var tags: [Int]
    
    init?(json: [String:Any]) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard
            let rawDate = json["date_gmt"] as? String,
            let date = dateFormatter.date(from: rawDate),
            let guidArray = json["guid"] as? [String:Any],
            let guid = guidArray["rendered"] as? String,
            let id = json["id"] as? Int,
            let rawLink = json["date_gmt"] as? String,
            let link = URL(string: rawLink),
            let rawModified = json["modified_gmt"] as? String,
            let modified = dateFormatter.date(from: rawModified),
            let rawStatus = json["status"] as? String,
            let status = Status(rawValue: rawStatus),
            let type = json["type"] as? String,
            let titleArray = json["title"] as? [String:Any],
            let title = titleArray["rendered"] as? String,
            let contentArray = json["content"] as? [String:Any],
            let renderedContent = contentArray["rendered"] as? String,
            let contentProtected = contentArray["protected"],
            let author = json["author"] as? Int,
            let excerptArray = json["excerpt"] as? [String:Any],
            let renderedExcerpt = excerptArray["rendered"] as? String,
            let excerptProtected = excerptArray["protected"],
            let featuredMedia = json["featured_media"] as? Int,
            let rawCommentStatus = json["comment_status"] as? String,
            let commentStatus = CommentStatus(rawValue: rawCommentStatus),
            let rawPingStatus = json["ping_status"] as? String,
            let pingStatus = PingStatus(rawValue: rawPingStatus),
            let rawFormat = json["format"] as? String,
            let format = Format(rawValue: rawFormat),
            let meta = json["meta"] as? [String],
            let sticky = json["sticky"] as? Bool,
            let template = json["template"] as? String,
            let categories = json["categories"] as? [Int],
            let tags = json["tags"] as? [Int]
        else { return nil }
        
        self.date = date
        self.guid = guid
        self.id = id
        self.link = link
        self.modified = modified
        self.status = status
        self.type = type
        self.title = title
        self.content = (rendered: renderedContent, protected: contentProtected as? String == "true")
        self.author = author
        self.excerpt = (rendered: renderedExcerpt, protected: excerptProtected as? String == "true")
        self.featuredMedia = featuredMedia
        self.commentStatus = commentStatus
        self.pingStatus = pingStatus
        self.format = format
        self.meta = meta
        self.sticky = sticky
        self.template = template
        self.categories = categories
        self.tags = tags
    }
}
