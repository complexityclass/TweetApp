//
//  TweetViewModuleAssembly.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class TweetViewModuleAssembly: NSObject, ModuleAssembly {
    
    @IBOutlet weak var viewController: TweetViewController!
    
    override func awakeFromNib() {
        
        let presenter = TweetViewPresenter()
        presenter.view = viewController
        presenter.context = defaultContext()
        
        viewController.output = presenter
    }
}
