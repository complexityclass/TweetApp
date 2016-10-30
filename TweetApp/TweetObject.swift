//
//  TweetObject.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

class TweetObject: ManagedObject, ManagedObjectType {
    
    static var entityName: String {
        return String(TweetObject)
    }
    
    static func insertInContext(context: NSManagedObjectContext, tweet: Tweet) -> TweetObject {
        let tweetObject: TweetObject = context.insertObject()
        tweetObject.text = tweet.text
        tweetObject.author = tweet.author
        tweetObject.date = tweet.date
        tweetObject.avatar = tweet.avatar?.absoluteString
        
        return tweetObject
    }
}
