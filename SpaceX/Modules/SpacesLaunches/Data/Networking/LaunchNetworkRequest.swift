//
//  LaunchNetworkRequest.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

struct LaunchNetworkRequest: ApiRequestable {
    
    var path: String
    
    var isFullPath: Bool
    
    var method: HTTPMethod
    
    var headerParameters: [String : String] = [:]
    
    var queryParametersEncodable: Encodable? = nil
    
    var queryParameters: [String : Any] = [:]
    
    var bodyParametersEncodable: Encodable? = nil
    
    var bodyParameters: [String : Any] = [:]
    
    var paramsEncoder: APIParamEncoder? = nil
    
}
