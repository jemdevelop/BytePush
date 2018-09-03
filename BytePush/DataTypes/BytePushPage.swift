//
//  BytePushPage.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPage: Codable {
    /// The date the object was published, as GMT.
    public let date: Date
    /// The globally unique identifier for the object.
    public let guid: Rendered
    /// Unique identifier for the object.
    public let id: Int
    /// URL to the object.
    public let link: URL
    /// The date the object was last modified, as GMT.
    public let modified: Date
    /// An alphanumeric identifier for the object unique to its type.
    public let slug: String
    /// A named status for the object.
    public let status: Status
    /// Type of Post for the object.
    public let type: String
    /// The title for the object.
    public let title: Rendered
    /// The content for the object.
    public let content: PostText
    /// The ID for the author of the object.
    public let author: Int
    /// The excerpt for the object.
    public let excerpt: PostText
    /// The ID of the featured media for the object.
    public let featuredMedia: Int
    /// Whether or not comments are open on the object.
    public let commentStatus: AllowedStatus
    /// Whether or not the object can be pinged.
    public let pingStatus: AllowedStatus
    /// The order of the object in relation to other object of its type.
    public let menuOrder: Int
    /// The theme file to use to display the object.
    public let template: String
    
    private enum CodingKeys: String, CodingKey {
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
