//
//  BookmarkLaunchUsecase.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

protocol BookmarkLaunchUsecase {
    
    func execute(bookmark: Bool, id: String) -> Bool
    
    func isLaunchBookmark(id: String) -> Bool
    
}
