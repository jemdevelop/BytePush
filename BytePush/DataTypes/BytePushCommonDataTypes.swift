//
//  BytePushCommonTypes.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public enum WPTaxonomy: String, Codable {
    case category, post_tag, nav_menu, link_category, post_format
}

public struct WPRendered: Codable {
    public let rendered: String
}

public enum WPStatus: String, Codable {
    case publish = "publish"
    case future = "future"
    case draft = "draft"
    case pending = "pending"
    case priv = "private"
    case inherit = "inherit"
}

public enum WPAllowedStatus: String, Codable {
    case open
    case closed
}

public struct WPPostText: Codable {
    public let rendered: String
    public let protected: Bool
}
