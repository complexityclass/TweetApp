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
        let token = obtainRequestToken()
        print(token)
        
        return token
    }
    
    private func obtainRequestToken() -> String {
        guard let apiMethodURL = NSURL(string: API.Authorization.requestToken.rawValue) else {
            return ""
        }
        
        let requestConfiguration = RequestConfiguration(requestURL: apiMethodURL)
        let request = requestBuilder.constructRequest(requestConfiguration)
        networkClient.performRequest(request) { (result) in
            do {
                let data = try result()
                print("data = \(data)")
            }
            catch let error as NSError {
                print("error = \(error)")
            }
        }
        
        return ""
    }
}