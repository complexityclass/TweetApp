//
//  TweetCell.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet weak var label: UILabel!
    
    func configureWithModel(model: TweetObject) {
        label.text = model.text
    }
    
    static let cellIdentifier = String(TweetCell)
}

