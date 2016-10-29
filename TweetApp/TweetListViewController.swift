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
        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let fetchRequest = NSFetchRequest(entityName: String(TweetObject))
//        fetchRequest.sortDescriptors = TweetObject.defaultSortDescriptors
//        fetchRequest.fetchBatchSize = 5
//        
//        let objects = try! appDelegate.coreDataStack.managedObjectContext.executeFetchRequest(fetchRequest)
//        
//        for object in objects {
//            print("object = \(object)")
//        }
        
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
