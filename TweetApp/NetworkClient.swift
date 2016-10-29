//
//  NetworkClient.swift
//  TweetApp
//
//  Created by Popov Valery on 29/10/2016.
//  Copyright © 2016 Popov Valery. All rights reserved.
//

import Foundation

/// Результат выполнения сетевого запроса
typealias NetworkClientResult = () throws -> NSData

/// Completion возвращающий ответ запроса или выбрасывающий исключение
typealias NetworkClientCompletion = (result: NetworkClientResult) -> Void


protocol NetworkClient {
    
    func performRequest(request: NSURLRequest, completion: NetworkClientCompletion?)
}

enum NetworkClientError: ErrorType {
    case emptyDataReturned
}