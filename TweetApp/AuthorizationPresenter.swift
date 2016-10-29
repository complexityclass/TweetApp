//
//  AuthorizationPresenter.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class AuthorizationPresenter: AuthorizationModuleInput, AuthorizationViewOutput {
    
    var authorizationService: AuthorizationServiceProtocol!
    
    func configure() {
    }
    
    // MARK: AuthorizationViewOutput
    
    func viewDidFinishLoading() {
    }
    
    func authButtonDidTapped() {
        
        let credentials = UserCredentials(login: "", password: "")
        let token = authorizationService.performAuth(credentials)
        
        print("authorize with token : \(token)")
    }
}