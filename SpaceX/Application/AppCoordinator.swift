//
//  AppCoordinator.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    let navigation: UINavigationController
    let diContainer: AppDIContainer
    
    init(navigation: UINavigationController, diContainer: AppDIContainer) {
        self.navigation = navigation
        self.diContainer = diContainer
    }
    
    func start() {
        let container = diContainer.makeLaunchesDIContainer()
        let launchCoordinator = container.makeLaunchesCoordinator(navigationController: navigation)
        launchCoordinator.start()
    }
    
}
