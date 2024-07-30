//
//  Colors.swift
//  SpaceX
//
//  Created by Bahar on 5/5/1403 AP.
//

import Foundation
import UIKit

struct Colors {
    static let primaryColor         = UIColor(hex: "#3498db" )
    static let secondaryColor       = UIColor(hex: "#2ecc71" )
    static let backgroundColor      = UIColor(hex: "#F7F7F7" )
    static let surfaceColor         = UIColor(hex: "#FFFFFF" )
    static let textColor            = UIColor(hex: "#2c3e50" )
    static let lineColor            = UIColor(hex: "#CFD8DC" )
    static let placeholderColor     = UIColor(hex: "#78909C" )
    static let successColor         = UIColor(hex: "#00B88D" )
    static let errorColor           = UIColor(hex: "#FF3B30" )
    static let warningColor         = UIColor(hex: "#FF9800" )
    static let darkBackgroundColor  = UIColor(hex: "#323232" )
    static let actionColor          = UIColor(hex: "#0096EB" )
    static let pageControllerColor  = UIColor(hex: "#65676a" )

    
    static func color(from hex: String) -> UIColor {
        return UIColor(hex: hex)
    }
}

