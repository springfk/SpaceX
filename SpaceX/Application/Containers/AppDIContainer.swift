//
//  AppDIContainer.swift
//  SpaceX
//
//  Created by Bahar on 5/10/1403 AP.
//

import Foundation

final class AppDIContainer {
    
    lazy var baseURL = URL(string: "https://api.spacexdata.com/v5/")!
    
    lazy var networkClient: ApiClient = {
       let client = HttpClientAPI(baseURL: baseURL)
        return client
    }()
    
    lazy var cache: URLCache = {
        let filePath = try? FileManager.default.url(for: .cachesDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: false)
        return URLCache(memoryCapacity: 50 * 1024 * 1024,
                 diskCapacity: 100 * 1024 * 1024,
                        directory: filePath)
    }()
    
    init() {
        
    }
    
    func makeLaunchesDIContainer() -> LaunchesDIContainer {
        LaunchesDIContainer(networkClient: networkClient, cache: cache)
    }
    
}
