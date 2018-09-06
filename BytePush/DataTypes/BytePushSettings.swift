//
//  BytePushSettings.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/5/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct BytePushSettings: Codable {
    /// Site title.
    public let title: String?
    /// Site tagline.
    public let description: String?
    /// A city in the same timezone as you.
    public let timezone: TimeZone?
    /// A date format for all date strings.
    public let dateFormat: String?
    /// A time format for all time strings.
    public let timeFormat: String?
    /// A day number of the week that the week should start on.
    public let startOfWeek: Int?
    /// WordPress locale code.
    public let language: Locale?
    /// Convert emoticons like :-) and :-P to graphics on display.
    public let useSmilies: Bool?
    /// Default post category.
    public let defaultCategory: Int?
    /// Default post format.
    public let defaultPostFormat: String?
    /// Blog pages show at most.
    public let postsPerPage: Int?
    /// Allow link notifications from other blogs (pingbacks and trackbacks) on new articles.
    public let defaultPingStatus: WPAllowedStatus?
    /// Allow people to post comments on new articles.
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
