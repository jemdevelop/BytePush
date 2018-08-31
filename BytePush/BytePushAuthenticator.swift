//
//  BytePushAuthentication.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/29/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushAuthenticator {
    enum AuthenticationType {
        case WPOAuthServer(clientID: String, clientSecret: String)
    }
    enum GrantType {
        case authorizationCode
        case implicit
        case refreshToken
        case clientCredential
    }
    let authenticationType: AuthenticationType
}
