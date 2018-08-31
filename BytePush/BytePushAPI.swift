//
//  WordPressAPI.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

enum Endpoint: String {
    case posts = "/wp/v2/posts"
    case categories = "/wp/v2/categories"
    case tags = "/wp/v2/tags"
    case pages = "/wp/v2/pages"
    case comments = "/wp/v2/comments"
    case media = "/wp/v2/media"
    case users = "/wp/v2/users"
}

public class BytePushAPI {
    /// The host address of the blog.
    let host: URL
    var authenticator: BytePushAuthenticationMethod?
    /// The login page URL of the blog.
    var loginPage: URL {
        return URL(string: "/wp-login.php", relativeTo: host)!
    }
    /// The admin page URL of the blog.
    var adminPage: URL {
        return URL(string: "wp-admin/admin.php", relativeTo: host)!
    }
    
    /// Creates a new instance with a given host URL and authentication method.
    init(blogURL host: URL, authenticator: BytePushAuthenticationMethod?) {
        self.host = host
        self.authenticator = authenticator
    }
    
    /// Creates a new instance with a given host URL.
    convenience init(blogURL host: URL) {
        self.init(blogURL: host, authenticator: nil)
    }
    
}
