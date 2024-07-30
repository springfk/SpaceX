//
//  ApiClient.swift
//  SpaceX
//
//  Created by Bahar on 5/8/1403 AP.
//

import Foundation


protocol APIClientTaskCancelable {
    func cancel()
}

extension URLSessionTask: APIClientTaskCancelable { }

protocol ApiClient: AnyObject {
    
    typealias CompletionHandler<T> = (Result<T, APIError>) -> Void
    
    @discardableResult
    func request<T: Decodable>(endpoint: ApiRequestable, completion: @escaping CompletionHandler <T>) throws -> APIClientTaskCancelable?
    
    @discardableResult
    func request(endpoint: ApiRequestable, completion: @escaping CompletionHandler <Data>) throws -> APIClientTaskCancelable?
}


