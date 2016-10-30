//
//  TweetListServiceTests.swift
//  TweetApp
//
//  Created by Popov Valery on 31/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import XCTest
import CoreData

class TweetListServiceTests: XCTestCase {
    
    var context: NSManagedObjectContext!

    override func setUp() {
        super.setUp()
        context = NSManagedObjectContext()
    }
    
    override func tearDown() {
        super.tearDown()
        context = nil
    }

    func testThatTweetServiceObtainedRequestFromRequestCongigurator() {
        //given
        let networkClientMock = NetworkClientMock()
        let requestConstructorMock = NetworkRequestConstructorMock()
        let operationBuilderMock = TweetServiceOperationBuilderMock()
        
        let service = TweetListServiceImplementation(client: networkClientMock,
                                                     constructor: requestConstructorMock,
                                                     context: context ,
                                                     operationBuilder: operationBuilderMock)
        
        
        
        //when
        service.loadTweets(.refreshNew)
        
        //then
        XCTAssertTrue(requestConstructorMock.constructRequestDidCalled)
    }
    
    // MARK: Mocks
    
    class NetworkClientMock: NetworkClient {
        
        var performRequestDidCalled: Bool = false
        
        func performRequest(request: NSURLRequest, completion: NetworkClientCompletion?) {
            performRequestDidCalled = true
        }
    }
    
    class NetworkRequestConstructorMock: NetworkRequestConstructor {
        
        var constructRequestDidCalled: Bool = false
        
        func constructRequest(configuration: RequestConfiguration) -> NSURLRequest {
            constructRequestDidCalled = true
            
            return NSURLRequest()
        }
    }
    
    class TweetServiceOperationBuilderMock: TweetServiceOperationBuilder {
        
        var buildOperationsCalled = false
        
        func buildTweetServiceOperations(request: NSURLRequest, client: NetworkClient, context: NSManagedObjectContext) -> [NSOperation] {
            buildOperationsCalled = true
            
            return []
        }
    }
}