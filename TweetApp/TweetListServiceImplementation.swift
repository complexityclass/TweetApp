//
//  TweetListServiceImplementation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData
import UIKit

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
        
        let firstAdapterOperation = NSBlockOperation {
            print("first connected")
            parsingOperation.data = tweetLoadingOperation.obtainedData
        }
        
        let savingOperation = TweetSavingOperation()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        savingOperation.context = appDelegate.coreDataStack.managedObjectContext
        
        let secondAdapterOperation = NSBlockOperation {
            print("second connected")
            savingOperation.tweets = parsingOperation.mappedTweets
        }
        
        firstAdapterOperation.addDependency(tweetLoadingOperation)
        parsingOperation.addDependency(firstAdapterOperation)
        secondAdapterOperation.addDependency(parsingOperation)
        savingOperation.addDependency(secondAdapterOperation)
        
        operationQueue.addOperation(tweetLoadingOperation)
        operationQueue.addOperation(firstAdapterOperation)
        operationQueue.addOperation(parsingOperation)
        operationQueue.addOperation(secondAdapterOperation)
        operationQueue.addOperation(savingOperation)
    }
}
