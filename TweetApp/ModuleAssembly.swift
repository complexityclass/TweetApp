//
//  ModuleAssembly.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import UIKit

protocol ModuleAssembly: class {
    
    func serviceAssembly() -> ServiceAssembly?
}

extension ModuleAssembly {
    func serviceAssembly() -> ServiceAssembly? {
        guard let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate  else {
            return nil
        }
        
        return appDelegate.serviceAssembly
    }
}