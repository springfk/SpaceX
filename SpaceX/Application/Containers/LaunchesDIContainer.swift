//
//  LaunchesDIContainer.swift
//  SpaceX
//
//  Created by Bahar on 5/10/1403 AP.
//

import Foundation
import UIKit

final class LaunchesDIContainer: MissionSceneFactory {
   
    
    let networkClient: ApiClient
    let cache: URLCache
    
    init(networkClient: ApiClient, cache: URLCache) {
        self.networkClient = networkClient
        self.cache = cache
    }
    
    // MARK: - Flow Coordinators
    func makeLaunchesCoordinator(navigationController: UINavigationController) -> MissionSceneCoordinator {
        MissionSceneCoordinator(
            navigationController: navigationController,
            dependenciesFactory: self
        )
    }
    
    // MARK: - MissionSceneFactory
    func makeLaunchesViewController(action: @escaping (LaunchMission) -> Void) -> MissionsListSceneRoot {
        let viewModel = MissionsListSceneViewModel(usecase: missionsUsecase,
                                                   imageUsecase: imageUseCase,
                                                   selectAction: action)
        let viewController = MissionsListSceneRoot(viewModel: viewModel)
        return viewController
    }
    
    func makeLaunchDetailsViewController(launch: LaunchMission,
                                         action: @escaping (URL) -> Void) -> MissionsDetailSceneRoot {
        let viewModel = MissionsDetailViewModel(entity: launch,
                                                imageUsecase: imageUseCase ,
                                                bookmarkUseCase: bookmarkUsecase,
                                                openlinkAction: action)
        return MissionsDetailSceneRoot(viewModel: viewModel)
    }
    
    
    // MARK: - Repositories
    func makeMissionRepository() -> MissionsRepositoryInterface {
        MissionRepository(networkClient: networkClient)
    }
    
    func makeImageRepository() -> ImagesRepositoryInterface {
        ImageRepository(cache: cache, networkClient: networkClient)
    }
    
    func makeBookmarkRepository() -> BookmarksRepositoryInterface {
        BookmarkRepository()
    }
    
    // MARK: - Usecases
    lazy var imageUseCase: ImageUseCase = {
        ImageUsecaseImp(repository: makeImageRepository())
    }()
    
    lazy var missionsUsecase: MissionsUsecases = {
        MissionsUsecasesImp(repository: makeMissionRepository())
    }()
    
    lazy var bookmarkUsecase: BookmarkLaunchUsecase = {
        BookmarkLaunchUsecaseImp(repository: makeBookmarkRepository())
    }()
    
    
}
