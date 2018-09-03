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
    public let id: Int
    /// Display name for the user.
    public let name: String
    /// URL of the user.
    public let url: String
    /// Description of the user.
    public let description: String?
    /// Author URL of the user.
    public let link: URL
    /// Avatar URLs for the user.
    public let avatarURLs: [String:URL]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, url, description, link
        case avatarURLs = "avatar_urls"
    }
}
