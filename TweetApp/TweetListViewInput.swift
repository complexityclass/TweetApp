//
//  TweetListViewInput.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

protocol TweetListViewInput: class {
    
    func setupInitialState()
    
    func performTransitionToTweetViewWithObjectID(objectID: NSManagedObjectID)
}