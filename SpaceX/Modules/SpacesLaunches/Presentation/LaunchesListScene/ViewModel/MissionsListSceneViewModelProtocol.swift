
//
//  missionsListScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation



protocol MissionsListSceneViewModelProtocol: AnyObject {
    
    
    typealias ItemsCompletionHandler = (_ didLoad: Bool, _ error: Error?) -> Void
    
    var items: [MissionListItemViewModel]  { get }
    
    func didSelectItem(atIndex index: Int)
    
    func loadInitialItems(completion: @escaping  ItemsCompletionHandler)
    
    func loadMoreItemIfNeeded(completion: @escaping ItemsCompletionHandler)
    
}
