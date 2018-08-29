//
//  BytePushCategory.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushCategory: Codable {
    enum Taxonomy: String, Codable {
        case category, post_tag, nav_menu, link_category, post_format
    }
    
    /// Unique identifier for the term.
    let id: Int
    /// Number of published posts for the term.
    let count: Int
    /// HTML description of the term.
    let description: String
    /// URL of the term.
    let link: URL
    /// HTML title for the term.
    let name: String
    /// An alphanumeric identifier for the term unique to its type.
    let slug: String
    /// Type attribution for the term.
    let taxonomy: Taxonomy
    /// The parent term ID.
    let parent: Int
}
