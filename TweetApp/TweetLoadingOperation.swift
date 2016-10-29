//
//  TweetLoadingOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class TweetLoadingOperation: NSOperation {
    
    var client: NetworkClient!
    var request: NSURLRequest!
    
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
    
    override func start() {
        if cancelled {
            finished = true
            return
        }
        
        client.performRequest(request) { [weak self] (result) in
            
            guard let strongSelf = self else { return }
            
            do {
                let data = try result()
                print("\(String(data: data, encoding: NSUTF8StringEncoding))")
                strongSelf.finished = true
            }
            catch let error as NSError {
                print("error = \(error)")
                strongSelf.finished = true
            }
        }
    }
    
    deinit {
        print("tweet loading operation deinited")
    }
}
