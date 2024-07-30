//
//  Date.swift
//  SpaceX
//
//  Created by Bahar on 5/6/1403 AP.
//

import Foundation
import UIKit

func convertUnixToDate(_ unixTimestamp: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: unixTimestamp)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    return dateFormatter.string(from: date)
}

