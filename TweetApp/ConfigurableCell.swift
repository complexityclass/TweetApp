//
//  ConfigurableCell.swift
//  TweetApp
//
//  Created by Popov Valery on 30/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype Model
    
    func configureWithModel(model: Model)
}