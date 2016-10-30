//
//  TweetViewOutput.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

protocol TweetViewOutput: class {
    
    func viewDidFinishLoadingWithModelID(modelID: NSManagedObjectID)
}