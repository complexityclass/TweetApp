//
//  TweetViewPresenter.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetViewPresenter: NSObject, TweetViewOutput {
    
    weak var view: TweetViewInput!
    var context: NSManagedObjectContext?
    
    // MARK: TweetViewOutput
    func viewDidFinishLoadingWithModelID(modelID: NSManagedObjectID) {
        guard let model = context?.objectWithID(modelID) as? TweetObject else {
            return
        }
        view.setupWithModel(model)
    }
}
