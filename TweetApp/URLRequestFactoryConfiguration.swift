//
//  URLRequestFactoryConfiguration.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

enum NetworkRequestTimeoutInterval: NSTimeInterval {
    case defaultInterval = 60.0
}

struct URLRequestFactoryConfiguration {
    let cachePolicy: NSURLRequestCachePolicy = .UseProtocolCachePolicy
    let timeOutInterval: NSTimeInterval = NetworkRequestTimeoutInterval.defaultInterval.rawValue
}