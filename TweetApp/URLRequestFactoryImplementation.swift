//
//  URLRequestFactoryImplementation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class URLRequestFactoryImplementation: URLRequestFactory {
    
    private let configuration: URLRequestFactoryConfiguration
    
    init(configuration: URLRequestFactoryConfiguration) {
        self.configuration = configuration
    }
    
    func createURLRequest(requestURL: NSURL) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: requestURL,
                                          cachePolicy: configuration.cachePolicy,
                                          timeoutInterval: configuration.timeOutInterval)
        return request
    }
}
