
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

protocol MissionsDetailSceneViewModelProtocol: AnyObject {
    // ViewModel Delegate protocol
    var messionInfo: LaunchesUIModel { get }
}
