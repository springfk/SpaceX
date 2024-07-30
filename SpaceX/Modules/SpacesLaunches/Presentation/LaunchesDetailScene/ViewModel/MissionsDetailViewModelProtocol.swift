
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

protocol MissionDetailImageViewModelProtocol: AnyObject {
    func loadImage(atIndex: Int, completion:@escaping (UIImage?) -> Void)
}


protocol MissionsDetailViewModelProtocol: MissionDetailImageViewModelProtocol {
    
    var imagesCount: Int { get }
    
    var isSuccessfull: Bool { get }
    
    var name: String { get }
    
    var date: String{ get }
    
    var description: String? { get }
    
    var isBookmarked: Bool { get }
    
    var hasWikipedia: Bool { get }
    
    func bookmark(_ bookmark: Bool)
    
    func loadImage(atIndex: Int, completion:@escaping (UIImage?) -> Void)
 
    func openWikipedia()
}
