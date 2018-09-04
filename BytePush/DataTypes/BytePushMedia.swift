//
//  BytePushMedia.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushMedia: Codable {
    public enum MediaType: String, Codable {
        case image, file
    }
    public struct MediaDetails: Codable {
        public struct MediaSize: Codable {
            public let file: String
            public let width: Int
            public let height: Int
            public let mimeType: String
            public let sourceURL: URL
            
            private enum CodingKeys: String, CodingKey {
                case file, width, height
                case mimeType = "mime_type"
                case sourceURL = "source_url"
            }
        }
        
        public let width: Int
        public let height: Int
        public let file: URL
        public let sizes: [String:MediaSize]
    }
    /// The date the object was published, as GMT.
    public let date: Date?
    /// The globally unique identifier for the object.
    public let guid: WPContainer?
    /// Unique identifier for the object.
    public let id: Int?
    /// URL to the object.
    public let link: URL?
    /// The date the object was last modified, as GMT.
    public let modified: Date?
    /// An alphanumeric identifier for the object unique to its type.
    public let slug: String?
    /// A named status for the object.
    public let status: WPStatus?
    /// Type of Post for the object.
    public let type: String?
    /// The title for the object.
    public let title: WPContainer?
    /// The ID for the author of the object.
    public let author: Int?
    /// Whether or not comments are open on the object.
    public let commentStatus: WPAllowedStatus?
    /// Whether or not the object can be pinged.
    public let pingStatus: WPAllowedStatus?
    /// The theme file to use to display the object.
    public let template: String?
    /// Alternative text to display when attachment is not displayed.
    public let altText: String?
    /// The attachment caption.
    public let caption: WPContainer?
    /// The attachment description.
    public let description: WPContainer?
    /// Attachment type.
    public let mediaType: String?
    /// The attachment MIME type.
    public let mimeType: String?
    /// Details about the media file, specific to its type.
    public let mediaDetails: MediaDetails?
    /// The ID for the associated post of the attachment.
    public let post: Int?
    /// URL to the original attachment file.
    public let sourceURL: URL?
    
    private enum CodingKeys: String, CodingKey {
        case date, guid, id, link, modified, slug, status, type, title
        case author, template, caption, description, post
        case commentStatus = "comment_status"
        case pingStatus = "ping_status"
        case altText = "alt_text"
        case mediaType = "media_type"
        case mimeType = "mime_type"
        case mediaDetails = "media_details"
        case sourceURL = "source_url"
    }
}
