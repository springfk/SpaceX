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
            
            enum SortOptions: String, Encodable {
                case ascending = "asc"
                case deascending = "desc"
            }
            //based on what we need
            var flight_number: SortOptions = .deascending

        }
    }
}
