
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

class MissionsDetailSceneViewModel: MissionsDetailSceneViewModelProtocol {
   
    var messionInfo: LaunchesUIModel
    
    init(messionInfo: LaunchesUIModel) {
        self.messionInfo = messionInfo
    }
}
