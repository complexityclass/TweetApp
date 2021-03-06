//
//  TweetListViewOutput.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

protocol TweetListViewOutput {
    
    func viewDidFinishLoading()
    
    func setupDataSource(tableView: UITableView)
    
    func viewDidSelectCellAtPath(indexPath: NSIndexPath)
    
    func didRequestDataReload()
}