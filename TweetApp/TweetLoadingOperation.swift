//
//  TweetLoadingOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class TweetLoadingOperation: BaseOperation {
    
    var client: NetworkClient!
    var request: NSURLRequest!
    var obtainedData: NSData?
    
    override func start() {
        if cancelled {
            finished = true
            return
        }
        
        client.performRequest(request) { [weak self] (result) in
            
            guard let strongSelf = self else { return }
            
            do {
                let data = try result()
                strongSelf.obtainedData = data
                strongSelf.finished = true
            }
            catch let error as NSError {
                print("error = \(error)")
                strongSelf.finished = true
            }
        }
    }
}
