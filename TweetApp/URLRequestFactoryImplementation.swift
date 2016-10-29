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
    
    func createURLRequest(requestURL: NSURL, urlParameters: [String: String]?) -> NSMutableURLRequest {
        
        var url = requestURL
        if let urlParameters = urlParameters {
            url = requestURL.URLByAppendingQueryParameters(urlParameters)
        }
        
        let request = NSMutableURLRequest(URL: url,
                                          cachePolicy: configuration.cachePolicy,
                                          timeoutInterval: configuration.timeOutInterval)
        return request
    }
}

protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = NSString(format: "%@=%@",
                                String(key).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!,
                                String(value).stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
            parts.append(part as String)
        }
        return parts.joinWithSeparator("&")
    }
}

extension NSURL {
    
    func URLByAppendingQueryParameters(parametersDictionary : Dictionary<String, String>) -> NSURL {
        let URLString : NSString = NSString(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return NSURL(string: URLString as String)!
    }
}