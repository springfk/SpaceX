//
//  LaunchDTO.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

struct LaunchDTO: Codable {
    let fairings: FairingsDTO?
    let links: LinksDTO
    let static_fire_date_utc: String?
    let static_fire_date_unix: Int?
    let net: Bool
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [String]?
    let details: String?
    let crew: [CrewDTO]?
    let ships, capsules, payloads: [String]?
    let launchpad: String?
    let flightNumber: Int
    let name, date_UTC: String
    let date_Unix: Double
    let date_Local: String
    let date_Precision: String?
    let upcoming: Bool
    let cores: [CoreDTO]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case static_fire_date_utc
        case static_fire_date_unix
        case net, window, rocket, success, failures
        case details, crew, ships, capsules, payloads, launchpad
        case flightNumber = "flight_number"
        case name
        case date_UTC = "date_utc"
        case date_Unix = "date_unix"
        case date_Local = "date_local"
        case date_Precision = "date_precision"
        case upcoming, cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }
}
