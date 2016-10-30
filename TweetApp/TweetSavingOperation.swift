//
//  TweetSavingOperation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

protocol TweetSavingOperationDelegate: class {
    
    func savingOperationDidFinishWithSaveElementsCount(count: Int, cursor: Int)
}

class TweetSavingOperation: BaseOperation {
    
    var context: NSManagedObjectContext?
    weak var delegate: TweetSavingOperationDelegate?
    
    var tweets: [Tweet]?
    
    override func main() {
        
        guard let tweets = tweets,
              let context = context else {
            return
        }
        
        var saveCount = 0
        var cursor = Int(tweets.first?.idString ?? "\(Int.max)")!
        context.performChanges {
            for tweet in tweets {
                if self.isNewTweet(tweet.idString) {
                    TweetObject.insertInContext(context, tweet: tweet)
                    let currentId = Int(tweet.idString) ?? 0
                    if currentId < cursor {
                        cursor = currentId
                    }
                    saveCount += 1
                }
            }
            self.delegate?.savingOperationDidFinishWithSaveElementsCount(saveCount, cursor: cursor)
        }
        
        finished = true
    }
    
    private func isNewTweet(tweetId: String) -> Bool {
        guard let context = context else { return true }
        let fetchRequest = NSFetchRequest(entityName: String(TweetObject))
        let predicate = NSPredicate(format: "idString = %@", tweetId)
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = true
        
        var unique = true
        
        do {
            let finded = try context.executeFetchRequest(fetchRequest)
            unique = finded.isEmpty
        } catch _ as NSError {}
        
        return unique
    }
    
    private func batchDelete() {
        if #available(iOS 9, *) {
            guard let context = context else { return }
            let fetchRequest = NSFetchRequest(entityName: String(TweetObject))
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try context.persistentStoreCoordinator?.executeRequest(deleteRequest, withContext: context)
            } catch _ as NSError {}
        }
    }
}
