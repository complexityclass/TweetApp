//
//  Tweet.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

struct Tweet {
    
    var date: NSDate?
    var author: String?
    let avatar: NSURL
    let text: String
}

extension Tweet {
    init?(dictionary: JSONDictionary) {
        guard let text = dictionary["text"] as? String else {
            return nil
        }
        
        self.text = text
        self.avatar = NSURL()
        
        if let user = dictionary["user"],
           let screenName = user["screen_name"] as? String {
            self.author = screenName
        }
        
        
        self.date = formatDate(dictionary["created_at"] as? String)
    }
    
    private func formatDate(dateString: String?) -> NSDate? {
        guard let dateString = dateString else { return nil }
        dateFormatter.dateFormat = Constants.dateFormat.rawValue
        
        return dateFormatter.dateFromString(dateString)
    }
}

private let dateFormatter = NSDateFormatter()

extension Tweet: CustomStringConvertible {
    var description: String {
        return " date: \(date ?? "no date")\n author: \(author ?? "no author")\n text: \(text)"
    }
}

private enum Constants: String {
    case dateFormat = "EEE MMM dd HH:mm:ss z yyy"
}