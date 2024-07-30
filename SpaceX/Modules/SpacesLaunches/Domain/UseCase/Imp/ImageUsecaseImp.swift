//
//  ImageUsecaseImp.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

final class ImageUsecaseImp: ImageUseCase {
    
    let repository : ImagesRepositoryInterface
    
    init(repository: ImagesRepositoryInterface) {
        self.repository = repository
    }
    
    func getImageData(for url: URL, completion: @escaping (Data?, (any Error)?) -> Void) {
        repository.getImage(for: url , cachePolicy: true) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure)
            }
        }
    }
}
