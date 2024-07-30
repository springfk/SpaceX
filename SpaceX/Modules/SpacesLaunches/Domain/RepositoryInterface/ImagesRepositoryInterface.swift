//
//  ImagesRepositoryInterface.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation
import UIKit

protocol ImagesRepositoryInterface: AnyObject {
    
    func getImage(for: URL, cachePolicy: Bool,
                  completion: @escaping (Result<Data, Error>) -> Void)
    
}
