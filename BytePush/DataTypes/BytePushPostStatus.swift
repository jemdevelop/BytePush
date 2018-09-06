//
//  BytePushPostStatus.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/5/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushPostStatus: Codable {
    /// The title for the status.
    public let name: String?
    /// Whether posts with this status should be private.
    public let privateStatus: Bool?
    /// Whether posts with this status should be protected.
    public let protectedStatus: Bool?
    /// Whether posts of this status should be shown in the front end of the site.
    public let publicStatus: Bool?
    /// Whether posts with this status should be publicly-queryable.
    public let queryable: Bool?
    /// Whether to include posts in the edit listing for their post type.
    public let showInList: Bool?
    /// An alphanumeric identifier for the status.
    public let slug: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, queryable, slug
        case privateStatus = "private"
        case protectedStatus = "protected"
        case publicStatus = "public"
        case showInList = "show_in_list"
    }
}
