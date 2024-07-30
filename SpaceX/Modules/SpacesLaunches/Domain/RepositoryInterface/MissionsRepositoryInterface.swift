//
//  MissionsRepositoryInterface.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

protocol MissionsRepositoryInterface: AnyObject {
   
    func getMissionLaunchesh(page: Int, size: Int, asceding: Bool,
                             completion: @escaping (Result<Page<LaunchMission>, Error>) -> Void)
}
