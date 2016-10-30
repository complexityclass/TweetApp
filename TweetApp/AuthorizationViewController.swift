//
//  AuthorizationViewController.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController, Router {
    
    var output: AuthorizationViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func authorizeTap(sender: AnyObject) {
        output.authButtonDidTapped()
        routeToTweetList()
    }
}
