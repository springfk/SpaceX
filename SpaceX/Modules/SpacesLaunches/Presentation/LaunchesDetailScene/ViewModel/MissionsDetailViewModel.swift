
//
//  missionsDetailScene.swift
//  SpaceX
//
//  Created by Bahar on 2024-07-26.
//  Copyright © 2024 SpaceX. All rights reserved.
//
import UIKit
import Foundation

class MissionsDetailViewModel: MissionsDetailViewModelProtocol {
    
    var imagesCount: Int {
        entity.links.flickr.original.count
    }
    
    var isSuccessfull: Bool {
        entity.success ?? false
    }
    
    var name: String {
        entity.name
    }
    
    var date: String = ""
    
    var description: String? {
        entity.details
    }
    
    var isBookmarked: Bool {
        bookmarkUseCase.isLaunchBookmark(id: entity.id)
    }
    
    var hasWikipedia: Bool {
        entity.links.wikipedia != nil
    }
    
   
    let imageUsecase: ImageUseCase
    let entity: LaunchMission
    let bookmarkUseCase: BookmarkLaunchUsecase
    let openlinkAction: (URL) -> Void
    
    init(entity: LaunchMission,
         imageUsecase: ImageUseCase,
         bookmarkUseCase: BookmarkLaunchUsecase,
         openlinkAction: @escaping (URL) -> Void) {
        self.imageUsecase = imageUsecase
        self.entity = entity
        self.bookmarkUseCase = bookmarkUseCase
        self.openlinkAction = openlinkAction
        date = convertUnixToDate(entity.date_Unix)
    }
    
    
    //bookmark
    func bookmark(_ bookmark: Bool) {
        _ = bookmarkUseCase.execute(bookmark: bookmark, id: entity.id)
    }
    
    func loadImage(atIndex index: Int, completion: @escaping (UIImage?) -> Void) {
        let images = entity.links.flickr.original
        guard let url = images[safe: index], let urlImage = URL(string: url) else {
            completion(nil)
            return
        }
        imageUsecase.getImageData(for: urlImage) { image, error in
            guard let data = image, let image = UIImage(data: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    func openWikipedia() {
        guard let urlStr = entity.links.wikipedia,
              let url = URL(string: urlStr) else {
            return
        }
        openlinkAction(url)
    }
    //caching
    
}

extension MissionsDetailViewModel: MissionDetailImageViewModelProtocol {}
