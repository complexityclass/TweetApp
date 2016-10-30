//
//  DataProvider.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

protocol DataProvider: class {
    associatedtype Object
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> Object
    
    func numberOfItemsInSection(section: Int) -> Int
}

protocol DataProviderDelegate: class {
    associatedtype Object
    
    func dataProviderDidUpdate(updates: [DataProviderUpdate<Object>]?)
}

enum DataProviderUpdate<Object> {
    case insert(NSIndexPath)
    case update(NSIndexPath, Object)
    case move(NSIndexPath, NSIndexPath)
    case delete(NSIndexPath)
}