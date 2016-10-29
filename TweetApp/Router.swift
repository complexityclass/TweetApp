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
}

extension Router where Self: AuthorizationViewController {
    
    func routeToTweetList() {
        performSegueWithIdentifier(SegueIdentifiers.tweetList.rawValue, sender: self)
    }
}

private enum SegueIdentifiers: String  {
    case tweetList = "showTweetList"
}