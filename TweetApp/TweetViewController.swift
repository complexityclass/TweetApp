//
//  TweetViewController.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit
import CoreData

class TweetViewController: UIViewController, TweetViewInput {
    
    var output: TweetViewOutput?
    var modelId: NSManagedObjectID?
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let modelId = modelId {
            output?.viewDidFinishLoadingWithModelID(modelId)
        }
    }
    
    func setupInitialState() {}
    
    func setupWithModel(tweetObject: TweetObject) {
        
        authorLabel.text = tweetObject.author
        if let date = tweetObject.date {
            dateLabel.text = localDateFormatter.stringFromDate(date)
        }
        avatarImageView.downloadImageFromURLString(tweetObject.avatar)
        tweetTextLabel.text = tweetObject.text
    }
    
    private let localDateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.formattingContext = .Standalone
        
        return dateFormatter
    }()
}
