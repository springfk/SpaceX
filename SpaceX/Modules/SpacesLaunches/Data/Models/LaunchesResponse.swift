//
//  LaunchesResponse.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

struct LaunchesResponse: Codable {
    
    let docs: [LaunchDTO]
    let totalDocs, offset, limit, totalPages: Int
    let page, pagingCounter: Int
    let hasPrevPage, hasNextPage: Bool
    let prevPage, nextPage: Int
}


