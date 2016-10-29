//
//  BaseOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class BaseOperation: NSOperation {
    
    var junk: Bool = false
    override var finished: Bool {
        get {
            return junk
        }
        set (newAnswer) {
            willChangeValueForKey("isFinished")
            junk = newAnswer
            didChangeValueForKey("isFinished")
        }
    }
    
    deinit {
        print("\(self) deinited")
    }
}
