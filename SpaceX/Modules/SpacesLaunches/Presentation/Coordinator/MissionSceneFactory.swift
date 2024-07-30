//
//  MissionSceneFactory.swift
//  SpaceX
//
//  Created by Bahar on 5/10/1403 AP.
//

import Foundation

protocol MissionSceneFactory {
    
    func makeLaunchesViewController(action:@escaping (LaunchMission) -> Void) -> MissionsListSceneRoot
    
    func makeLaunchDetailsViewController(launch: LaunchMission,
                                         action: @escaping (URL) -> Void) -> MissionsDetailSceneRoot
}
