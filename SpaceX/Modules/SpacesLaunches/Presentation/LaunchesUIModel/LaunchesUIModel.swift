//
//  MessionInfoUIModel.swift
//  SpaceX
//
//  Created by Bahar on 5/6/1403 AP.
//

import Foundation
import UIKit

struct LaunchesUIModel {
    let name: String
    let iconURL: URL?
    let dateUnix: Int
    let details: String?
    let flightNumber: Int
    let success: Bool
    let wikipediaURL: String?
    let imageURLs: [URL]?
}
