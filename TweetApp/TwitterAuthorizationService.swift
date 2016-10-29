//
//  TwitterAuthorizationService.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class TwitterAuthorizationService: AuthorizationServiceProtocol {
    
    let networkClient: NetworkClient
    let requestBuilder: NetworkRequestConstructor
    
    init(client: NetworkClient, constructor: NetworkRequestConstructor) {
        self.networkClient = client
        self.requestBuilder = constructor
    }
    
    func performAuth(credentials: UserCredentials) -> String {
        let token = obtainBearerToken()
        return token
    }
    
    //TODO: Заменить на реальную авторизацию
    private func obtainBearerToken() -> String {
        return "AAAAAAAAAAAAAAAAAAAAAFvixgAAAAAATbonDP453frNAA%2F9jAsMcVY%2Fht8%3D5MfSRQYRpy0tolROFcwIcTip5or3pBVOJFi51EmwpQ06B194iw"
    }
}