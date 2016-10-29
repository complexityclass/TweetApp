//
//  APIStructure.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

enum API {
    
    enum Authorization: String {
        case requestToken = "https://api.twitter.com/oauth/request_token"
    }
    
    enum Timeline: String {
        case user_timeline = "https://api.twitter.com/1.1/statuses/user_timeline.json"
    }
}