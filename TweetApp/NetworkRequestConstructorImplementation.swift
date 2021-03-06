//
//  NetworkRequestConstructorImplementation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class NetworkRequestConstructorImplementation: NetworkRequestConstructor {
    
    private let urlRequestFactory: URLRequestFactory
    
    init(urlRequestFactory: URLRequestFactory) {
        self.urlRequestFactory = urlRequestFactory
    }
    
    func constructRequest(configuration: RequestConfiguration) -> NSURLRequest {
        let request = urlRequestFactory.createURLRequest(configuration.requestURL, urlParameters: configuration.urlParameters)
        request.HTTPMethod = configuration.requestType.rawValue
        if let params = configuration.parameters {
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrinted)
        }
        
        if let headers = configuration.headers {
            for (header, value) in headers {
                request.addValue(value, forHTTPHeaderField: header)
            }
        }
        
        return request.copy() as! NSURLRequest
    }
}
