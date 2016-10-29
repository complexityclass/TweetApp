//
//  TweetListPresenter.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class TweetListPresenter: TweetListViewOutput {
    
    weak var view: TweetListViewInput?
    var service: TweetListService?
    
    // MARK: TweetListViewOutput
    func viewDidFinishLoading() {
        service?.loadTweets(nil)
    }
}