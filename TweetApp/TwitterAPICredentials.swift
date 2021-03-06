//
//  TwitterAPICredentials.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

struct Credentials {
    
    private static let Bearer = "Bearer AAAAAAAAAAAAAAAAAAAAAFvixgAAAAAATbonDP453frNAA%2F9jAsMcVY%2Fht8%3D5MfSRQYRpy0tolROFcwIcTip5or3pBVOJFi51EmwpQ06B194iw"
    
    static let requestHeaders = ["Accept-Encoding": "gzip",
                                  "Authorization" : Bearer]
    
    private static let defaultBatchSize: Int = 20
    static func urlParameters(cursor: Int?, count: Int) -> [String: String] {
        
        var parameters = ["screen_name": "twitterapi"]
        
        parameters["count"] = (count > defaultBatchSize) ? "\(count)" : "\(defaultBatchSize)"
        if let cursor = cursor {
            let cursorKey = "max_id"
            let value = "\(cursor)"
            parameters[cursorKey] = value
        }
        
        return parameters
    }
}