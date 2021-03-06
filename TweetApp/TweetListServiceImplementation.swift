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
    var operationBuilder: TweetServiceOperationBuilder
    var context: NSManagedObjectContext
    
    var currentCursor: Int?
    private var totalTweetsCount: Int = 20
    private let observers: NSMapTable = NSMapTable(keyOptions: .StrongMemory, valueOptions: .WeakMemory, capacity: 5)
    
    let operationQueue: NSOperationQueue = NSOperationQueue()
    
    init(client: NetworkClient,
         constructor: NetworkRequestConstructor,
         context: NSManagedObjectContext,
         operationBuilder: TweetServiceOperationBuilder) {
        
        self.networkClient = client
        self.requestBuilder = constructor
        self.context = context
        self.operationBuilder = operationBuilder
    }
    
    func loadTweets(loadType: TweetLoadType) {
        
        guard let apiURL = NSURL(string: API.Timeline.user_timeline.rawValue) else {
            return
        }
        
        var fetchCursor: Int?
        var fetchCount: Int = totalTweetsCount
        switch loadType {
        case .refreshNew:
            fetchCursor = nil
            fetchCount = totalTweetsCount
        case .fetchMoreOld:
            fetchCursor = currentCursor
            fetchCount += 20
            
        }
        
        let requestConfiguration = RequestConfiguration(requestURL: apiURL,
                                                        requestType: .GET,
                                                        parameters: nil,
                                                        headers: credentials.requestHeaders,
                                                        urlParameters: credentials.urlParameters(fetchCursor, count: fetchCount))
        
        let request = requestBuilder.constructRequest(requestConfiguration)
        let operations = operationBuilder.buildTweetServiceOperations(request, client: networkClient, context: context)
        
        for operation in operations {
            operationQueue.addOperation(operation)
        }
    }
    
    func obtainedTweetCount() -> Int {
        return totalTweetsCount
    }
    
    func addObserver(observer: TweetListServiceObserver) {
        observers.setObject(observer, forKey: String(observer.dynamicType))
    }
}

extension TweetListServiceImplementation: TweetSavingOperationDelegate {
    func savingOperationDidFinishWithSaveElementsCount(count: Int, cursor: Int) {
        totalTweetsCount += count
        currentCursor = cursor
        let enumerator = observers.objectEnumerator()
        while let observer = enumerator?.nextObject() as? TweetListServiceObserver  {
            observer.serviceActualizedData()
        }
    }
}