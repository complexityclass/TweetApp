//
//  TweetListPresenter.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetListPresenter: NSObject, TweetListViewOutput {
    
    weak var view: TweetListViewInput?
    var service: TweetListService?
    var context: NSManagedObjectContext!
    
    private typealias Data = FetchedResultsDataProvider<TweetListPresenter>
    private var dataSource: TableViewDataSource<TweetListPresenter, Data, TweetCell>!
    private var serviceIsBusy: Bool = false
    
    // MARK: TweetListViewOutput
    
    func viewDidFinishLoading() {
        service?.loadTweets(.refreshNew)
    }
    
    func setupDataSource(tableView: UITableView) {
        
        let fetchRequest = NSFetchRequest(entityName: String(TweetObject))
        fetchRequest.sortDescriptors = TweetObject.defaultSortDescriptors
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.sortDescriptors = TweetObject.defaultSortDescriptors
        
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: context,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        let dataProvider = FetchedResultsDataProvider(fetchedResultsController: fetchedResultsController, delegate: self)
        dataSource = TableViewDataSource(tableView: tableView, dataProvider: dataProvider, delegate: self)
        
        tableView.delegate = self
    }
    
    func viewDidSelectCellAtPath(indexPath: NSIndexPath) {
        let object = dataSource.dataProvider.objectAtIndexPath(indexPath)
        let objectID = object.objectID
        view?.performTransitionToTweetViewWithObjectID(objectID)
    }
    
    func didRequestDataReload() {
        service?.loadTweets(.refreshNew)
    }
}

extension TweetListPresenter: DataProviderDelegate {
    func dataProviderDidUpdate(updates: [DataProviderUpdate<TweetObject>]?) {
        dataSource.processUpdates(updates)
        view?.shouldEndRefreshing()
    }
}

extension TweetListPresenter: DataSourceDelegate {
    func cellIdentifierForObject(object: Object) -> String {
        return TweetCell.cellIdentifier
    }
}

extension TweetListPresenter: TweetListServiceObserver {
    func serviceActualizedData() {
        serviceIsBusy = false
        view?.shouldEndRefreshing()
    }
}

extension TweetListPresenter: UITableViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.bounds.size.height) {
            if !serviceIsBusy {
                serviceIsBusy = true
                service?.loadTweets(.fetchMoreOld)
            }
        }
    }
}