//
//  BytePushSettings.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/5/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushSettings: Codable {
    public let title: String?
    public let description: String?
    public let timezone: TimeZone?
    public let dateFormat: String?
    public let timeFormat: String?
    public let startOfWeek: Int?
    public let language: Locale?
    public let useSmilies: Bool?
    public let defaultCategory: Int?
    public let defaultPostFormat: String?
    public let postsPerPage: Int?
    public let defaultPingStatus: WPAllowedStatus?
    public let defaultCommentStatus: WPAllowedStatus?
    
    private enum CodingKeys: String, CodingKey {
        case title, description, timezone, language
        case dateFormat = "date_format"
        case timeFormat = "time_format"
        case startOfWeek = "start_of_week"
        case useSmilies = "use_smilies"
        case defaultCategory = "default_category"
        case defaultPostFormat = "default_post_format"
        case postsPerPage = "posts_per_page"
        case defaultPingStatus = "default_ping_status"
        case defaultCommentStatus = "default_comment_status"
    }
}
