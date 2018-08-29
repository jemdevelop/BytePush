//
//  BytePushUser.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushUser: Codable {
    /// Unique identifier for the user.
    let id: Int
    /// Display name for the user.
    let name: String
    /// URL of the user.
    let url: URL?
    /// Description of the user.
    let description: String?
    /// Author URL of the user.
    let link: URL
    /// Avatar URLs for the user.
    let avatarURLs: [String:URL]
    /// Meta fields.
    let meta: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, name, url, description, link, meta
        case avatarURLs = "avatar_urls"
    }
}
