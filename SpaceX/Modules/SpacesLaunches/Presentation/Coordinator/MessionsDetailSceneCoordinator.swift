
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation


class MissionsDetailSceneCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with mession: LaunchesUIModel) {
        
        let viewModel = MissionsDetailSceneViewModel(messionInfo: mession)
        let viewController = MissionsDetailSceneRoot(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
