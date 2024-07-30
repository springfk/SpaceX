//
//  ImageRepository.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation


final class ImageRepository: ImagesRepositoryInterface {
    
    let cache: URLCache
    let networkClient: ApiClient
    
    init(cache: URLCache, networkClient: ApiClient) {
        self.cache = cache
        self.networkClient = networkClient
    }
    
    func getImage(for url: URL, cachePolicy: Bool,
                  completion: @escaping (Result<Data, any Error>) -> Void) {
        
        if cachePolicy, let data = getImageFromCache(at: url) {
            completion(.success(data))
            return
        }
        // create new image request
        let request = ImageNetworkRequest(path: url.absoluteString, isFullPath: url.scheme != nil)
        do {
            try networkClient.request(endpoint: request) {[weak self] (result: Result<Data, APIError>) in
                guard case .success(let data) = result else {
                    completion(result.mapError { $0 as Error })
                    return
                }
                if cachePolicy {
                    self?.cacheImageFor(url: url, data: data)
                }
                completion(result.mapError { $0 as Error})
            }
        } catch let error {
            completion(.failure(error))
        }
        
    }
    
    func getImageFromCache(at url: URL) -> Data? {
        guard let cache = cache.cachedResponse(for: URLRequest(url: url)) else {
            return  nil
        }
        return cache.data
    }
    
    @discardableResult
    func cacheImageFor(url: URL, data: Data) -> Bool {
        guard let response = HTTPURLResponse(url: url,
                                             statusCode: 200, httpVersion: nil, headerFields: nil) else {
            return false
        }
        let cacheResponse = CachedURLResponse(response: response, data: data, storagePolicy: .allowed)
        
        cache.storeCachedResponse(cacheResponse, for: URLRequest(url: url))
        return true
    }
    
}
