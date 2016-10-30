//
//  ServiceAssembly.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation
import CoreData

class ServiceAssembly {
    
    var defaultContext: NSManagedObjectContext!
    
    func authorizationService() -> AuthorizationServiceProtocol {
        let urlRequestFactory = URLRequestFactoryImplementation(configuration: URLRequestFactoryConfiguration())
        let requestConstructor = NetworkRequestConstructorImplementation(urlRequestFactory: urlRequestFactory)
        let authorizationService = TwitterAuthorizationService(client: networkClient, constructor: requestConstructor)
        
        return authorizationService
    }
    
    func tweetListService() -> TweetListService {
        let urlRequestFactory = URLRequestFactoryImplementation(configuration: URLRequestFactoryConfiguration())
        let requestConstructor = NetworkRequestConstructorImplementation(urlRequestFactory: urlRequestFactory)
        let operationBuilder = TweetServiceOperationBuilderImplementation()
        let tweetListService = TweetListServiceImplementation(client: networkClient,
                                                              constructor: requestConstructor,
                                                              context: defaultContext,
                                                              operationBuilder: operationBuilder)
        operationBuilder.tweetListService = tweetListService
        
        return tweetListService
    }
    
    lazy var networkClient: NetworkClient = {
        return NetworkClientImplementation(session: NSURLSession.sharedSession())
    }()
}