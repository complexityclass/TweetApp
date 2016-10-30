//
//  TweetListService.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

enum TweetLoadType {
    case refreshNew
    case fetchMoreOld
}

protocol TweetListService {
    
    func loadTweets(loadType: TweetLoadType)
    
    func addObserver(observer: TweetListServiceObserver)
    
    func obtainedTweetCount() -> Int
}

protocol TweetListServiceObserver: class {
    
    func serviceActualizedData()
}
