//
//  BytePushAuthenticationMethodOAuth.swift
//  BytePush
//
//  Created by Jonathan Monreal on 8/31/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushAuthenticationMethodOAuth: BytePushAuthenticationMethod {
    enum OAuthGrantType {
        case authorizationCode
        case implicit
        case clientCredential
        case resourceOwnerPasswordCredentials
        case refreshToken
    }
    struct OAuthGrant {
        var accessToken: String?
        var expiresIn: TimeInterval
        var expiration: Date
        var refreshToken: String?
    }
    
    var grantType: OAuthGrantType
    
    var requestString: String {
        // TODO
        return ""
    }
}
