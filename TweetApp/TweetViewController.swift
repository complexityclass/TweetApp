//
//  TweetViewController.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetViewController: UIViewController {
    
    var modelId: NSManagedObjectID?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(modelId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
