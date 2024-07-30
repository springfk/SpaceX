//
//  ImageNetworkRequest.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

struct ImageNetworkRequest: ApiRequestable {
    
    var path: String
    
    var isFullPath: Bool = true
    
    var method: HTTPMethod { .get }
    
    var headerParameters: [String : String] = [:]
    
    var queryParametersEncodable: (any Encodable)? = nil
    
    var queryParameters: [String : Any] = [:]
    
    var bodyParametersEncodable: (any Encodable)? = nil
    
    var bodyParameters: [String : Any] = [:]
    
    var paramsEncoder: (any APIParamEncoder)? = nil
    
}
