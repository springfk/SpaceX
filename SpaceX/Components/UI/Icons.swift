//
//  Icons.swift
//  SpaceX
//
//  Created by Bahar on 5/5/1403 AP.
//

import Foundation
import UIKit

struct Icons {
    
    static let back = UIImage(named: "back")
    static let chevron =  UIImage(named: "chevron")
    static let close =  UIImage(named: "close")
    /// Add more icons
 
    static func icon(named name: String) -> UIImage? {
        return UIImage(named: name)
    }
}
