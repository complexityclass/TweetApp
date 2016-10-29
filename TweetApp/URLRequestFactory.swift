//
//  URLRequestFactory.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

protocol URLRequestFactory {
    
    func createURLRequest(requestURL: NSURL, urlParameters: [String: String]?) -> NSMutableURLRequest
}