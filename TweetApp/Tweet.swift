//
//  Tweet.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

struct Tweet {
    
    let idString: String
    let text: String
    var date: NSDate?
    var author: String?
    var avatar: NSURL?
}

extension Tweet {
    init?(dictionary: JSONDictionary) {
        guard let text = dictionary["text"] as? String,
              let idString = dictionary["id_str"] as? String else {
            return nil
        }
        
        self.text = text
        self.idString = idString
        
        if let user = dictionary["user"] {
            
            if let screenName = user["screen_name"] as? String {
                self.author = screenName
            }
            
            if let avatarString = user["profile_image_url"] as? String {
                self.avatar = NSURL(string: avatarString)
            }
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
        return " date: \(date ?? "no date")\n author: \(author ?? "no author")\n text: \(text)\n avatar: \(avatar ?? "no avatar") \n id: \(idString)"
    }
}

private enum Constants: String {
    case dateFormat = "EEE MMM dd HH:mm:ss z yyy"
}