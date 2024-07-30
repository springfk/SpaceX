//
//  FairingsDTO.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

struct FairingsDTO: Codable {
    let reused, recovery_attempt, recovered: Bool?
    let ships: [String]?

    enum CodingKeys: String, CodingKey {
        case reused
        case recovery_attempt
        case recovered, ships
    }
}
