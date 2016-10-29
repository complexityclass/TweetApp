//
//  TweetSavingOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

class TweetSavingOperation: BaseOperation {
    
    var context: NSManagedObjectContext?
    var tweets: [Tweet]?
    
    override func main() {
        
        guard let tweets = tweets,
              let context = context else {
            return
        }
        
        context.performChanges {
            for tweet in tweets {
                TweetObject.insertInContext(context, tweet: tweet)
            }
        }
        
        finished = true
    }
}
