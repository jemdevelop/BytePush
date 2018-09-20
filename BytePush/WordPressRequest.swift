//
//  WordPressRequest.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/19/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public protocol WordPressRequest: Encodable {
    var wpEndpointURL: URL { get }
    var getURL: URL? { get }
}
