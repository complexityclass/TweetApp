//
//  TweetParsingOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

typealias JSONDictionary = [String: AnyObject]

class TweetParsingOperation: BaseOperation {
    
    var data: NSData?
    var mappedTweets: [Tweet]?
    
    override func main() {
        guard let data = data else {
            return
        }
        
        do {
            let array = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
            if let array = array as? [JSONDictionary] {
                let tweets = array.flatMap(Tweet.init)
                for tweet in tweets {
                    print("--------")
                    print(tweet)
                }
                mappedTweets = tweets
            }
            
            finished = true
            
        } catch let error as NSError {
            print(error)
            finished = true
        }
    }
}
