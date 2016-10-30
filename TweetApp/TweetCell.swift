//
//  TweetCell.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    func configureWithModel(model: TweetObject) {
        authorNameLabel.text = model.author ?? "author"
        if let date = model.date {
            dateLabel.text = sharedDateFormatter.stringFromDate(date)
        }
        tweetTextLabel.text = model.text
    }
    
    private let sharedDateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.formattingContext = .Standalone
        
        return dateFormatter
    }()
    
    static let cellIdentifier = String(TweetCell)
}

