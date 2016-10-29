//
//  TweetParsingOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class TweetParsingOperation: NSOperation {
    
    var data: NSData?
    var error: NSError?
    
    override func main() {
        guard let data = data else {
            return
        }
        
        print("parse data : \(String(data: data, encoding: NSUTF8StringEncoding))")
    }
}
