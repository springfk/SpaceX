//
//  BookmarksRepositoryInterface.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

protocol BookmarksRepositoryInterface: AnyObject {
    
    typealias Bookmarks = Dictionary<String, Bool>
    
    // get bookmarks
    func getBookmarks() -> Bookmarks
    
    // add book
    func addBookmark(for id: String) -> Bool
    
    // remove book mark
    func removeBookmark(atId: String) -> Bool
}
