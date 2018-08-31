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
    let guid: Rendered
    let id: Int
    let link: URL
    let modified: Date
    let slug: String
    let status: Status
    let type: String
    let title: Rendered
    let author: Int
    let commentStatus: AllowedStatus
    let pingStatus: AllowedStatus
    let template: String
    let altText: String
    let caption: Rendered
    let description: Rendered
    let mediaType: String
    let mimeType: String
    let mediaDetails: MediaDetails
    let post: Int?
    let sourceURL: URL
    
    enum CodingKeys: String, CodingKey {
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
