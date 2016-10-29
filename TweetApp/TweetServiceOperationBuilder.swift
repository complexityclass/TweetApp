//
//  TweetServiceOperationBuilder.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

protocol TweetServiceOperationBuilder {
    
    func buildTweetServiceOperations(request: NSURLRequest, client: NetworkClient, context: NSManagedObjectContext) -> [NSOperation]
}

class TweetServiceOperationBuilderImplementation: TweetServiceOperationBuilder {
    
    func buildTweetServiceOperations(request: NSURLRequest, client: NetworkClient, context: NSManagedObjectContext) -> [NSOperation] {
        
        let tweetLoadingOperation = TweetLoadingOperation()
        tweetLoadingOperation.client = client
        tweetLoadingOperation.request = request
        
        let parsingOperation = TweetParsingOperation()
        
        let firstAdapterOperation = NSBlockOperation {
            parsingOperation.data = tweetLoadingOperation.obtainedData
        }
        
        let savingOperation = TweetSavingOperation()
        savingOperation.context = context
        
        let secondAdapterOperation = NSBlockOperation {
            savingOperation.tweets = parsingOperation.mappedTweets
        }
        
        firstAdapterOperation.addDependency(tweetLoadingOperation)
        parsingOperation.addDependency(firstAdapterOperation)
        secondAdapterOperation.addDependency(parsingOperation)
        savingOperation.addDependency(secondAdapterOperation)
        
        return [tweetLoadingOperation, firstAdapterOperation, parsingOperation, secondAdapterOperation, savingOperation]
    }
}