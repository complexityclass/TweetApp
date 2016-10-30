//
//  ApplicationRouter.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

protocol Router {
    
    func routeToTweetList()
    
    func routeToSingleTweet()
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?, configurationBlock: (UIViewController -> Void))
}


extension Router where Self: AuthorizationViewController {
    
    func routeToTweetList() {
        performSegueWithIdentifier(SegueIdentifiers.tweetList.rawValue, sender: self)
    }
    
    func routeToSingleTweet() {}
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?, configurationBlock: (UIViewController -> Void)) {}
}

extension Router where Self: TweetListViewController {
    func routeToTweetList() {}
    
    func routeToSingleTweet() {
        performSegueWithIdentifier(SegueIdentifiers.singleTweet.rawValue, sender: self)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?, configurationBlock: (UIViewController -> Void)) {
        guard let toViewController = segue.destinationViewController as? TweetViewController else {
           return
        }
        
        configurationBlock(toViewController)
    }
}

private enum SegueIdentifiers: String  {
    case tweetList = "showTweetList"
    case singleTweet = "showSingleTweet"
}