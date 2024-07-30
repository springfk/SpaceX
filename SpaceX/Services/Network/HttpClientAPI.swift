//
//  HttpClientApi.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

class HttpClientAPI: ApiClient {
    
    private let session: URLSession
    let baseURL : URL

    init(baseURL: URL, session: URLSession = .shared) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func request<T: Decodable>(endpoint: ApiRequestable, completion: @escaping CompletionHandler <T>) throws -> APIClientTaskCancelable? {
        
        let request = try endpoint.urlRequest(baseURL: baseURL)
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            if let error = error, let mappedError = self.handleError(error) {
                completion(.failure(mappedError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.validationResponse(statusCode: -1, message: "There is no response")))
                return
            }
            
            guard 200..<300 ~= response.statusCode else {
                completion(.failure(.validationResponse(statusCode: response.statusCode, message: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.validationResponse(statusCode: response.statusCode, message: "There is no data")))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedObject = try decoder.decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch let decodingError {
                completion(.failure(.decodingError(decodingError)))
            }
        }
        task.resume()
        return task
    }
 
    
    func request(endpoint: ApiRequestable, completion: @escaping CompletionHandler <Data>) throws -> APIClientTaskCancelable? {
        let request = try endpoint.urlRequest(baseURL: baseURL)
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            if let error = error, let mappedError = self.handleError(error) {
                completion(.failure(mappedError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.validationResponse(statusCode: -1, message: "There is no response")))
                return
            }
            
            guard 200..<300 ~= response.statusCode else {
                completion(.failure(.validationResponse(statusCode: response.statusCode, message: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.validationResponse(statusCode: response.statusCode, message: "There is no data")))
                return
            }
            completion(.success(data))
        }
        task.resume()
        return task
    }
    
    private func handleError(_ error: Error) -> APIError? {
        switch error {
        case let error as URLError where error.code == .notConnectedToInternet:
            return APIError.notConnectedToInternet
        case let error as URLError where error.code == .cancelled:
            return nil
        default:
            return .requestFailed(error)
        }
    }
}

