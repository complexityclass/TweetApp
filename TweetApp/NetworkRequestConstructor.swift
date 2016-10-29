//
//  NetworkRequestConstructor.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

/// Протокол создание сетевых запросов
protocol NetworkRequestConstructor {
    
    func constructRequest(configuration: RequestConfiguration) -> NSURLRequest
}

struct RequestConfiguration {
    let requestURL: NSURL
    let requestType: RequestType
    let parameters: [String: AnyObject]?
}

enum RequestType: String {
    case POST
    case GET
}

let PostStringParameterKey = "PostStringParameterKey"

