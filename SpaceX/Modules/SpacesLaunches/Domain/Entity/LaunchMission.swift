//
//  LaunchMission.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

struct LaunchMission: Codable {
    let fairings: Fairings?
    let links: Links
    let static_fire_date_utc: String?
    let static_fire_date_unix: Int?
    let net: Bool
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [String]?
    let details: String?
    let crew: [Crew]?
    let ships, capsules, payloads: [String]?
    let launchpad: String?
    let flightNumber: Int
    let name, date_UTC: String
    let date_Unix: Double
    let date_Local: String
    let date_Precision: String?
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case static_fire_date_utc
        case static_fire_date_unix
        case net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case flightNumber
        case name
        case date_UTC
        case date_Unix
        case date_Local
        case date_Precision
        case upcoming, cores
        case autoUpdate
        case tbd
        case launchLibraryID
        case id
    }
}
