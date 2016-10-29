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
    var credentials = Credentials.self
    
    let operationQueue: NSOperationQueue = NSOperationQueue()
    
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
                                                        headers: credentials.requestHeaders,
                                                        urlParameters: credentials.urlParameters)
        
        let request = requestBuilder.constructRequest(requestConfiguration)
        
        let tweetLoadingOperation = TweetLoadingOperation()
        tweetLoadingOperation.client = networkClient
        tweetLoadingOperation.request = request
        
        let parsingOperation = TweetParsingOperation()
        
        let adapterOperation = NSBlockOperation {
            parsingOperation.data = tweetLoadingOperation.obtainedData
        }
        
        adapterOperation.addDependency(tweetLoadingOperation)
        parsingOperation.addDependency(adapterOperation)
        
        operationQueue.addOperation(tweetLoadingOperation)
        operationQueue.addOperation(adapterOperation)
        operationQueue.addOperation(parsingOperation)
    }
}
