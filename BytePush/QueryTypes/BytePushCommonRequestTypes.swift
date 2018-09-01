//
//  BytePushCommonRequestTypes.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/1/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

enum Context: String, Codable {
    case view, embed, edit
}

enum Order: String, Codable {
    case ascending = "asc"
    case descending = "desc"
}

enum OrderBy: String, Codable {
    case author, date, id, include, modified, parent, relevance
    case slug, title
}
