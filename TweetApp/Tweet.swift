//
//  Tweet.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

struct Tweet {
    
    let date: NSDate
    let author: String
    let avatar: NSURL
    let text: String
}

extension Tweet {
    init?(dictionary: JSONDictionary) {
        guard let text = dictionary["text"] as? String else {
            return nil
        }
        
        self.text = text
        self.date = NSDate()
        self.avatar = NSURL()
        self.author = ""
    }
}

extension Tweet: CustomStringConvertible {
    var description: String {
        return "\(text)"
    }
}