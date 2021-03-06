//
//  TweetListModuleAssembly.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class TweetListModuleAssembly: NSObject, ModuleAssembly {

    @IBOutlet weak var viewController: TweetListViewController!
    
    override func awakeFromNib() {
        
        let presenter = TweetListPresenter()
        presenter.view = viewController
        
        let tweetListService = serviceAssembly()?.tweetListService()
        presenter.service = tweetListService
        presenter.context = defaultContext()
        
        viewController.output = presenter
        tweetListService?.addObserver(presenter)
    }
}
