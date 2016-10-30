//
//  TweetListService.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

protocol TweetListService {
    
    func loadTweets(maxId: Int?)
    
    func addObserver(observer: TweetListServiceObserver)
}

protocol TweetListServiceObserver: class {
    
    func serviceActualizedData()
}
