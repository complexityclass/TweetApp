//
//  TweetListPresenter.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetListPresenter: TweetListViewOutput {
    
    weak var view: TweetListViewInput?
    var service: TweetListService?
    var context: NSManagedObjectContext!
    
    private typealias Data = FetchedResultsDataProvider<TweetListPresenter>
    private var dataSource: TableViewDataSource<TweetListPresenter, Data, TweetCell>!
    
    // MARK: TweetListViewOutput
    func viewDidFinishLoading() {
        service?.loadTweets(nil)
    }
    
    func setupDataSource(tableView: UITableView) {
        
        let fetchRequest = NSFetchRequest(entityName: String(TweetObject))
        fetchRequest.sortDescriptors = TweetObject.defaultSortDescriptors
        fetchRequest.fetchBatchSize = 20
        fetchRequest.returnsObjectsAsFaults = false
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: context,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        let dataProvider = FetchedResultsDataProvider(fetchedResultsController: fetchedResultsController, delegate: self)
        dataSource = TableViewDataSource(tableView: tableView, dataProvider: dataProvider, delegate: self)
    }
}

extension TweetListPresenter: DataProviderDelegate {
    func dataProviderDidUpdate(updates: [DataProviderUpdate<TweetObject>]?) {
        dataSource.processUpdates(updates)
    }
}

extension TweetListPresenter: DataSourceDelegate {
    func cellIdentifierForObject(object: Object) -> String {
        return "Tweet"
    }
}