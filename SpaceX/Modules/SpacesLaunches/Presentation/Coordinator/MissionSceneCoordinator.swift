
//
//  MissionSceneCoordinator.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation


class MissionSceneCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependenciesFactory: MissionSceneFactory
    
    
    init(navigationController: UINavigationController,
         dependenciesFactory: MissionSceneFactory) {
        self.navigationController = navigationController
        self.dependenciesFactory = dependenciesFactory
    }
    
    func start() {
        let viewController = dependenciesFactory.makeLaunchesViewController(action: navigateToDetails)
        navigationController?.pushViewController(viewController, animated: false)
    }
    
    private func navigateToDetails(_ mission: LaunchMission) {
        let detailsVC = dependenciesFactory.makeLaunchDetailsViewController(launch: mission) { url in
            UIApplication.shared.open(url, options: [:], completionHandler: { success in
                if !success {
                    print("Failed to open Wikipedia Address: \(url)")
                }
            })
        }
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    /**
     UIApplication.shared.open(url, options: [:], completionHandler: { success in
         if !success {
             print("Failed to open Wikipedia Address: \(url)")
         }
     })
     */
    ///*/
}
