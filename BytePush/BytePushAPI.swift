//
//  WordPressAPI.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/28/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

enum WordPressEndpoint: String {
    case posts = "/wp/v2/posts"
    case categories = "/wp/v2/categories"
    case tags = "/wp/v2/tags"
    case pages = "/wp/v2/pages"
    case comments = "/wp/v2/comments"
    case media = "/wp/v2/media"
    case users = "/wp/v2/users"
}

public class BytePushAPI {
    let baseRoute = "/wp-json"
    /// The host address of the blog.
    let hostURL: URL
    /// The login page URL of the blog.
    var loginPage: URL {
        return URL(string: "/wp-login.php", relativeTo: hostURL)!
    }
    /// The admin page URL of the blog.
    var adminPage: URL {
        return URL(string: "wp-admin/admin.php", relativeTo: hostURL)!
    }
    var hostURLComponents: URLComponents {
        return URLComponents(url: hostURL, resolvingAgainstBaseURL: false)!
    }
    
    init(blogURL hostURL: URL) {
        self.hostURL = hostURL
    }
    
    func getPostPage(_ page: Int, postsPerPage perPage: Int? = nil, result: @escaping (WordPressQueryResult<BytePushPost>) -> Void) {
        var urlComponents = hostURLComponents
        urlComponents.path = baseRoute + WordPressEndpoint.posts.rawValue
        guard let url = urlComponents.url else {
            return
        }
        var query = BytePushPostQuery(queryURL: url)
        query.page = page
        query.perPage = perPage
        query.execute(result: result)
    }
}
