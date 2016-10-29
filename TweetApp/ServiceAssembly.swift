//
//  ServiceAssembly.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class ServiceAssembly {
    
    func authorizationService() -> AuthorizationServiceProtocol {
        let urlRequestFactory = URLRequestFactoryImplementation(configuration: URLRequestFactoryConfiguration())
        let requestConstructor = NetworkRequestConstructorImplementation(urlRequestFactory: urlRequestFactory)
        let authorizationService = TwitterAuthorizationService(client: networkClient, constructor: requestConstructor)
        
        return authorizationService
    }
    
    lazy var networkClient: NetworkClient = {
        return NetworkClientImplementation(session: NSURLSession.sharedSession())
    }()
}