//
//  AuthorizationServiceProtocol.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

protocol AuthorizationServiceProtocol {
    
    func performAuth(credentials: UserCredentials) -> String
}

struct UserCredentials {
    let login: String
    let password: String
}