//
//  BytePushMedia.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushMedia: Codable {
    enum MediaType: String, Codable {
        case image, file
    }
    struct MediaDetails: Codable {
        struct MediaSize: Codable {
            let file: String
            let width: Int
            let height: Int
            let mimeType: String
            let sourceURL: URL
            
            enum CodingKeys: String, CodingKey {
                case file, width, height
                case mimeType = "mime_type"
                case sourceURL = "source_url"
            }
        }
        
        let width: Int
        let height: Int
        let file: URL
        let sizes: [String:MediaSize]
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
    /// The ID for the author of the object.
    let author: Int
    /// Whether or not comments are open on the object.
    let commentStatus: AllowedStatus
    /// Whether or not the object can be pinged.
    let pingStatus: AllowedStatus
    /// The theme file to use to display the object.
    let template: String
    /// Alternative text to display when attachment is not displayed.
    let altText: String
    /// The attachment caption.
    let caption: Rendered
    /// The attachment description.
    let description: Rendered
    /// Attachment type.
    let mediaType: String
    /// The attachment MIME type.
    let mimeType: String
    /// Details about the media file, specific to its type.
    let mediaDetails: MediaDetails
    /// The ID for the associated post of the attachment.
    let post: Int?
    /// URL to the original attachment file.
    let sourceURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case guid, id, link, slug, status, type, title, author, template
        case caption, description, post
        case date = "date_gmt"
        case modified = "modified_gmt"
        case commentStatus = "comment_status"
        case pingStatus = "ping_status"
        case altText = "alt_text"
        case mediaType = "media_type"
        case mimeType = "mime_type"
        case mediaDetails = "media_details"
        case sourceURL = "source_url"
    }
}
