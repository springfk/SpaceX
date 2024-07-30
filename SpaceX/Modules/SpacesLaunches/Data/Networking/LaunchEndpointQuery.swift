//
//  LaunchEndpointQuery.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

struct LaunchEndpointQuery: Encodable {
    let query: Query
    let options: Options
    
    struct Query: Encodable {
        let upcoming: Bool
    }
    
    struct Options: Encodable {
        let limit: Int
        let page: Int
        let sort: Sort
        
        struct Sort: Encodable {
            //based on what we need
            let flight_number: String
        }
    }
}
