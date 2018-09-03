//
//  WordPressURL.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/3/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public struct WordPressURL {
    fileprivate struct Endpoints {
        fileprivate static var restPath = "/wp-json"
        fileprivate enum RESTEndpoint: String {
            case posts = "/wp/v2/posts"
            case categories = "/wp/v2/categories"
            case tags = "/wp/v2/tags"
            case pages = "/wp/v2/pages"
            case comments = "/wp/v2/comments"
            case media = "/wp/v2/media"
            case users = "/wp/v2/users"
        }
    }
    
    /// The base URL of the blog.
    public let baseURL: URL
    /// The login page URL of the blog.
    public var loginPage: URL {
        return URL(string: "/wp-login.php", relativeTo: baseURL)!
    }
    /// The admin page URL of the blog.
    public var adminPage: URL {
        return URL(string: "wp-admin/admin.php", relativeTo: baseURL)!
    }
    /// The default posts REST API URL for the blog.
    public var posts: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.posts.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    /// The default categories REST API URL for the blog.
    public var categories: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.categories.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    /// The default tags REST API URL for the blog.
    public var tags: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.tags.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    /// The default pages REST API URL for the blog.
    public var pages: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.pages.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    /// The default comments REST API URL for the blog.
    public var comments: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.comments.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    /// The default media REST API URL for the blog.
    public var media: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.media.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    /// The default users REST API URL for the blog.
    public var users: URL {
        let endpoint = Endpoints.restPath + Endpoints.RESTEndpoint.users.rawValue
        return baseURL.appendingPathComponent(endpoint)
    }
    
    public init(blogURL baseURL: URL) {
        self.baseURL = baseURL
    }
}
