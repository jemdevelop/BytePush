//
//  WordPressAPI.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

enum Taxonomy: String, Codable {
    case category, post_tag, nav_menu, link_category, post_format
}

public class BytePushAPI {
    let host: URL
    
    init(blogURL host: URL) {
        self.host = host
    }
}
