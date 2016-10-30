//
//  TweetViewController.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetViewController: UIViewController, TweetViewInput {
    
    var output: TweetViewOutput?
    
    var modelId: NSManagedObjectID?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let modelId = modelId {
            output?.viewDidFinishLoadingWithModelID(modelId)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupInitialState() {
    }
    
    func setupWithModel(tweetObject: TweetObject) {
        print("Did setup with object")
    }
}
