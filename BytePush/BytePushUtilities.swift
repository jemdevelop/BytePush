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
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}
