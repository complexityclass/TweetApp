//
//  NetworkRequestConstructor.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

/// Протокол создание сетевых запросов
protocol NetworkrequestConstructor {
    
    func constructRequest(parameters: [String: AnyObject]?) throws -> NSURLRequest
}

struct RequestConfiguration {
    let requestURL: NSURL
}