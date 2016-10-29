//
//  TweetObject+CoreDataProperties.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TweetObject {

    @NSManaged var author: String?
    @NSManaged var date: NSDate?
    @NSManaged var avatar: String?
    @NSManaged var text: String?

}
