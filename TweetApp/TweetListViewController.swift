//
//  TweetListViewController.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetListViewController: UIViewController, TweetListViewInput {
    
    var output: TweetListViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidFinishLoading()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TweetListViewInput
    
    func setupInitialState() {
        
    }
}
