//
//  AuthorizationModuleAssembly.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

class AuthorizationModuleAssembly: NSObject, ModuleAssembly {
    
    @IBOutlet weak var viewController: AuthorizationViewController!
    
    override func awakeFromNib() {
        
        let presenter = AuthorizationPresenter()
        presenter.authorizationService = self.serviceAssembly()?.authorizationService()
        viewController.output = presenter
    }
}