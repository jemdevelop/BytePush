//
//  BytePushPage.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPage: Codable {
    enum Status: String, Codable {
        case publish = "publish"
        case future = "future"
        case draft = "draft"
        case pending = "pending"
        case priv = "private"
    }
    enum AllowedStatus: String, Codable {
        case open
        case closed
    }
    struct PostText: Codable {
        let rendered: String
        let protected: Bool
    }
    
    /// The date the object was published, as GMT.
    let date: Date
    /// The globally unique identifier for the object.
    let guid: Rendered
    /// Unique identifier for the object.
    let id: Int
    /// URL to the object.
    let link: URL
    /// The date the object was last modified, as GMT.
    let modified: Date
    /// An alphanumeric identifier for the object unique to its type.
    let slug: String
    /// A named status for the object.
    let status: Status
    /// Type of Post for the object.
    let type: String
    /// The title for the object.
    let title: Rendered
    /// The content for the object.
    let content: PostText
    /// The ID for the author of the object.
    let author: Int
    /// The excerpt for the object.
    let excerpt: PostText
    /// The ID of the featured media for the object.
    let featuredMedia: Int
    /// Whether or not comments are open on the object.
    let commentStatus: AllowedStatus
    /// Whether or not the object can be pinged.
    let pingStatus: AllowedStatus
    /// The order of the object in relation to other object of its type.
    let menuOrder: Int
    /// The theme file to use to display the object.
    let template: String
    
    enum CodingKeys: String, CodingKey {
        case id, link, slug, status, type, title, content, author, excerpt, template
        case date = "date_gmt"
        case guid = "guid"
        case modified = "modified_gmt"
        case featuredMedia = "featured_media"
        case commentStatus = "comment_status"
        case pingStatus = "ping_status"
        case menuOrder = "menu_order"
    }
}
