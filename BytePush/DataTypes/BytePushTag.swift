//
//  BytePushTag.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushTag: Codable {
    /// Unique identifier for the term.
    public let id: Int?
    /// Number of published posts for the term.
    public let count: Int?
    /// HTML description of the term.
    public let description: String?
    /// URL of the term.
    public let link: URL?
    /// HTML title for the term.
    public let name: String?
    /// An alphanumeric identifier for the term unique to its type.
    public let slug: String?
    /// Type attribution for the term.
    public let taxonomy: WPTaxonomy?
}
