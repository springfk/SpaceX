//
//  BookmarkLaunchUsecaseImp.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

final class BookmarkLaunchUsecaseImp: BookmarkLaunchUsecase {
    
    let repository : BookmarksRepositoryInterface
    
    init(repository: BookmarksRepositoryInterface) {
        self.repository = repository
    }
    
    func execute(bookmark: Bool, id: String) -> Bool {
        if (bookmark) {
            return repository.addBookmark(for: id)
        }
        return repository.removeBookmark(atId: id)
    }
    
    func isLaunchBookmark(id: String) -> Bool {
        let bookmarks = repository.getBookmarks()
        return bookmarks[id] != nil && bookmarks[id]!
    }
    
}
