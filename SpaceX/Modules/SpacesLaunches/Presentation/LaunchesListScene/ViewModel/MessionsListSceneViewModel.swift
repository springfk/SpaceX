
//
//  missionsListScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

final class MissionsListSceneViewModel: MissionsListSceneViewModelProtocol {
    var items: [MissionListItemViewModel]
    
    private var entities: [LaunchMission]
    private let selectAction: (LaunchMission) -> Void
    let missionUsecase: MissionsUsecases
    let imageUsecase: ImageUseCase
    
    // for pagination purpose
    private var page = 1
    private var size = 20
    private var hasNext: Bool = true
    
    init(usecase: MissionsUsecases, imageUsecase: ImageUseCase,
         selectAction: @escaping (LaunchMission) -> Void) {
        self.items = []
        self.entities = []
        self.selectAction = selectAction
        self.missionUsecase = usecase
        self.imageUsecase = imageUsecase
    }
    

    func didSelectItem(atIndex index: Int) {
        guard let item = entities[safe: index] else {
            return
        }
        selectAction(item)
    }
    
    func loadInitialItems(completion: @escaping ItemsCompletionHandler) {
        guard items.isEmpty else {
            completion(false, nil)
            return
        }
        missionUsecase.getLauches(page: page, size: size,
                                  sortAsc: false) {[weak self] page, error in
            self?.performOnMainQueue {
                guard error == nil else {
                    completion(false, error!)
                    return
                }
                
                self?.handleReceived(page: page)
                completion(true, nil)
            }
        }
    }
    
    func loadMoreItemIfNeeded(completion: @escaping ItemsCompletionHandler) {
        missionUsecase.getLauches(page: page, size: size, sortAsc: false) {[weak self] page, error in
            self?.performOnMainQueue {
                guard error == nil else {
                    completion(false, error!)
                    return
                }
                
                self?.handleReceived(page: page)
                completion(true, nil)
            }
        }
    }
    
    private func performOnMainQueue(block: @escaping () -> Void ) {
        DispatchQueue.main.async(execute: block)
    }
    
    private func handleReceived(page: Page<LaunchMission>?) {
        guard let page = page else {
            return
        }
        
        self.page = page.page
        hasNext = page.hasNextPage
        entities = entities + page.items
        items = entities.map {
            DefaultMissionListItemViewCell(entity: $0, imageUsecase: imageUsecase)
        }
    }
 
}


