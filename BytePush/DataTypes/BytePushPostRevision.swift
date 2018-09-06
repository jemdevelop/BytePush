//
//  BytePushPostRevision.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/5/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushPostRevision {
    /// The ID for the author of the object.
    public let author: Int?
    /// The date the object was published, in the site's timezone.
    public let date: Date?
    /// The date the object was published, as GMT.
    public let dateGMT: Date?
    /// The globally unique identifier for the object.
    public let guid: WPContainer?
    /// Unique identifier for the object.
    public let id: Int?
    /// The date the object was last modified, in the site's timezone.
    public let modified: Date?
    /// The date the object was last modified, as GMT.
    public let modifiedGMT: Date?
    /// The ID for the parent of the object.
    public let parent: Int?
    /// An alphanumeric identifier for the object unique to its type.
    public let slug: String?
    /// The title for the object.
    public let title: WPContainer?
    /// The content for the object.
    public let content: WPContent?
    /// The excerpt for the object.
    public let excerpt: WPContent?
    
    private enum CodingKeys: String, CodingKey {
        case author, date, guid, id, modified, parent, slug, title, content
        case excerpt
        case dateGMT = "date_gmt"
        case modifiedGMT = "modified_gmt"
    }
}
