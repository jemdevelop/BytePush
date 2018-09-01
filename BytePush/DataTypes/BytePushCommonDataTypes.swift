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
    let rendered: String
}

enum Status: String, Codable {
    case publish = "publish"
    case future = "future"
    case draft = "draft"
    case pending = "pending"
    case priv = "private"
    case inherit = "inherit"
}

enum AllowedStatus: String, Codable {
    case open
    case closed
}

struct PostText: Codable {
    let rendered: String
    let protected: Bool
}
