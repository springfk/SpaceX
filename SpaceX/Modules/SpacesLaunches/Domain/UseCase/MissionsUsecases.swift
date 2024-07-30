//
//  MissionsUsecases.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

protocol MissionsUsecases {
    
    func getLauches(page: Int, size: Int, sortAsc: Bool,
                    completion: @escaping (_ page: Page<LaunchMission>?, _ error: Error?) -> Void)
    
}
