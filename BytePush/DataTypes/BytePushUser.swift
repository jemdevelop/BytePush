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
    public let id: Int?
    /// Login name for the user.
    public let username: String
    /// Display name for the user.
    public let name: String?
    /// First name for the user.
    public let firstName: String?
    /// Last name for the user.
    public let lastName: String?
    /// The email address for the user.
    public let email: String?
    /// URL of the user.
    public let url: String?
    /// Description of the user.
    public let description: String?
    /// Author URL of the user.
    public let link: URL?
    /// Locale for the user.
    public let locale: String?
    /// The nickname for the user.
    public let nickname: String?
    /// An alphanumeric identifier for the user.
    public let slug: String?
    /// Registration date for the user.
    public let registeredDate: Date?
    /// Roles assigned to the user.
    public let roles: [String]?
    // public let capabilities:
    // public let extraCapabilities:
    /// Avatar URLs for the user.
    public let avatarURLs: [String:URL]?
    
    private enum CodingKeys: String, CodingKey {
        case id, username, name, email, url, description, link, locale
        case nickname, slug, roles
        case firstName = "first_name"
        case lastName = "last_name"
        case registeredDate = "registered_date"
        case avatarURLs = "avatar_urls"
    }
}
