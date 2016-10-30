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
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    private(set) var model: TweetObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureWithModel(model: TweetObject) {
        self.model = model
        authorNameLabel.text = model.author ?? "author"
        if let date = model.date {
            dateLabel.text = sharedDateFormatter.stringFromDate(date)
        }
        
        avatarImageView.downloadImageFromURLString(model.avatar)
        tweetTextLabel.text = model.text
    }
    
    private let sharedDateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.doesRelativeDateFormatting = true
        dateFormatter.formattingContext = .Standalone
        
        return dateFormatter
    }()
    
    private func loadImage(urlString: String) {
    }
    
    static let cellIdentifier = String(TweetCell)
    
    func handleTap(sender: AnyObject) {
        UIApplication.sharedApplication().sendAction(#selector(TweetListViewController.didChooseTweetCell(_:)),
                                                     to: nil, from: self, forEvent: nil)
    }
}

