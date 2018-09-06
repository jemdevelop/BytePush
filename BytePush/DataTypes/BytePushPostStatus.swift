//
//  BytePushPostStatus.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/5/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushPostStatus: Codable {
    public let name: String?
    public let privateStatus: Bool?
    public let protectedStatus: Bool?
    public let publicStatus: Bool?
    public let queryable: Bool?
    public let showInList: Bool?
    public let slug: String?
    
    private enum CodingKeys: String, CodingKey {
        case name, queryable, slug
        case privateStatus = "private"
        case protectedStatus = "protected"
        case publicStatus = "public"
        case showInList = "show_in_list"
    }
}
