//
//  TweetListServiceImplementation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class TweetListServiceImplementation: TweetListService {
    
    let networkClient: NetworkClient
    let requestBuilder: NetworkRequestConstructor
    
    init(client: NetworkClient, constructor: NetworkRequestConstructor) {
        self.networkClient = client
        self.requestBuilder = constructor
    }
    
    func obtainTweets(maxId: Int?, completion: [AnyObject]) {
        
        guard let apiURL = NSURL(string: API.Timeline.user_timeline.rawValue) else {
            return
        }
        
        let requestConfiguration = RequestConfiguration(requestURL: apiURL,
                                                        requestType: .GET,
                                                        parameters: nil,
                                                        headers: requestHeaders,
                                                        urlParameters: urlParameters)
        
        let request = requestBuilder.constructRequest(requestConfiguration)
        
        networkClient.performRequest(request) { (result) in
            
            do {
                let data = try result()
                print("\(String(data: data, encoding: NSUTF8StringEncoding))")
            }
            catch let error as NSError {
                print("error = \(error)")
            }
        }
    }
    
    private let requestHeaders = ["Accept-Encoding": "gzip",
                "Authorization" : "Bearer AAAAAAAAAAAAAAAAAAAAAFvixgAAAAAATbonDP453frNAA%2F9jAsMcVY%2Fht8%3D5MfSRQYRpy0tolROFcwIcTip5or3pBVOJFi51EmwpQ06B194iw"]
    
    private let urlParameters = [
        "screen_name": "twitterapi",
        "count": "10",
        ]
}