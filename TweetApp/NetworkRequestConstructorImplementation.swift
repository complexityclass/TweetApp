//
//  NetworkRequestConstructorImplementation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class NetworkRequestConstructorImplementation: NetworkrequestConstructor {
    
    private let urlRequestFactory: URLRequestFactory
    private let requestConfiguration: RequestConfiguration
    
    init(configuration: RequestConfiguration, urlRequestFactory: URLRequestFactory) {
        self.requestConfiguration = configuration
        self.urlRequestFactory = urlRequestFactory
    }
    
    func constructRequest(parameters: [String : AnyObject]?) throws -> NSURLRequest {
        let request = urlRequestFactory.createURLRequest(requestConfiguration.requestURL)
        
        return request.copy() as! NSURLRequest
    }
}
