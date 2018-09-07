//
//  WordPressOperation.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/7/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

public protocol WordPressOperation: Encodable {
    var wpEndpointURL: URL { get set }
}
