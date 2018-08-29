//
//  WordPressAPI.swift
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

public class BytePushAPI {
    let host: URL
    
    init(blogURL host: URL) {
        self.host = host
    }
}
