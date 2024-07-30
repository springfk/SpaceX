//
//  ArrayExtension.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation


extension Array {
    
    subscript(safe index: Int) -> Element? {
        guard indices.contains(index) else {
            return nil
        }
        return self[index]
    }
}
