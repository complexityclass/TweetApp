//
//  TweetListViewController.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetListViewController: UIViewController, TweetListViewInput, Router {
    
    var output: TweetListViewOutput?
    @IBOutlet weak var tableView: UITableView!
    
    private var modelID: NSManagedObjectID?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView(tableView)
        output?.setupDataSource(tableView)
        output?.viewDidFinishLoading()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupTableView(tableView: UITableView) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    // MARK: Event handlers
    
    func didChooseTweetCell(sender: UITableViewCell) {
        guard let cell = sender as? TweetCell,
            let indexPath = tableView.indexPathForCell(cell) else {
            return
        }
        
        output?.viewDidSelectCellAtPath(indexPath)
    }
    
    // MARK: TweetListViewInput
    
    func setupInitialState() {
    }
    
    func performTransitionToTweetViewWithObjectID(objectID: NSManagedObjectID) {
        self.modelID = objectID
        routeToSingleTweet()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        prepareForSegue(segue, sender: sender) { [unowned self] controller in
            guard let controller = controller as? TweetViewController else { return }
            controller.modelId = self.modelID
        }
    }
}
