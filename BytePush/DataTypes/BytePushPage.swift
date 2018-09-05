//
//  BytePushPage.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPage: Codable {
    /// The date the object was published, in the site's timezone.
    public let date: Date?
    /// The date the object was published, as GMT.
    public let dateGMT: Date?
    /// The globally unique identifier for the object.
    public let guid: WPContainer?
    /// Unique identifier for the object.
    public let id: Int?
    /// URL to the object.
    public let link: URL?
    /// The date the object was last modified, in the site's timezone.
    public let modified: Date?
    /// The date the object was last modified, as GMT.
    public let modifiedGMT: Date?
    /// An alphanumeric identifier for the object unique to its type.
    public let slug: String?
    /// A named status for the object.
    public let status: WPStatus?
    /// Type of Post for the object.
    public let type: String?
    /// A password to protect access to the content and excerpt.
    public let password: String?
    /// The ID for the parent of the object.
    public let parent: Int?
    /// The title for the object.
    public let title: WPContainer?
    /// The content for the object.
    public let content: WPContent?
    /// The ID for the author of the object.
    public let author: Int?
    /// The excerpt for the object.
    public let excerpt: WPContent?
    /// The ID of the featured media for the object.
    public let featuredMedia: Int?
    /// Whether or not comments are open on the object.
    public let commentStatus: WPAllowedStatus?
    /// Whether or not the object can be pinged.
    public let pingStatus: WPAllowedStatus?
    /// The order of the object in relation to other object of its type.
    public let menuOrder: Int?
    /// The theme file to use to display the object.
    public let template: String?
    
    private enum CodingKeys: String, CodingKey {
        case date, guid, id, modified, link, slug, status, type, password, parent
        case title, content, author, excerpt, template
        case dateGMT = "date_gmt"
        case modifiedGMT = "modified_gmt"
        case featuredMedia = "featured_media"
        case commentStatus = "comment_status"
        case pingStatus = "ping_status"
        case menuOrder = "menu_order"
    }
}
