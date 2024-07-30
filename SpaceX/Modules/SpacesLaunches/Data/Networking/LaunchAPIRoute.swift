//
//  LaunchAPIRoute.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

enum LaunchAPIRoute: String {
    case query = "launches/query"
    
    var route: String {
        rawValue
    }
}
