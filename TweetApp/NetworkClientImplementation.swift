//
//  NetworkClientImplementation.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

class NetworkClientImplementation: NetworkClient {
    
    private let session: NSURLSession
    
    init(session: NSURLSession) {
        self.session = session
    }
    
    // MARK: - Network Client
    
    func performRequest(request: NSURLRequest, completion: NetworkClientCompletion?) {
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            completion? (result: {
                if let networkError = error {
                    throw networkError
                }
                
                guard let responseData = data else {
                    throw NetworkClientError.emptyDataReturned
                }
                
                return responseData
            })
        }
        dataTask.resume()
    }
}
