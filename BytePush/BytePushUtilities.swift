//
//  BytePushUtilities.swift
//  BytePush
//
//  Created by Jonathan Monreal on 9/3/18.
//  Copyright © 2018 Jonathan Monreal. All rights reserved.
//

import Foundation

struct BytePushUtilities {
    static var wpDateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
    
    static var wpJSONEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        let dateFormatter = wpDateFormatter
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        return encoder
    }()
    
    static var wpJSONDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let dateFormatter = BytePushUtilities.wpDateFormatter
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
}
