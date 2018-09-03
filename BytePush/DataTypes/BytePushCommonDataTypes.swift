//
//  BytePushCommonTypes.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public enum Taxonomy: String, Codable {
    case category, post_tag, nav_menu, link_category, post_format
}

public struct Rendered: Codable {
    public let rendered: String
}

public enum Status: String, Codable {
    case publish = "publish"
    case future = "future"
    case draft = "draft"
    case pending = "pending"
    case priv = "private"
    case inherit = "inherit"
}

public enum AllowedStatus: String, Codable {
    case open
    case closed
}

public struct PostText: Codable {
    public let rendered: String
    public let protected: Bool
}
