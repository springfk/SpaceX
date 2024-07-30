//
//  ImageUsecase.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

protocol ImageUseCase {
    
    func getImageData(for url: URL, completion: @escaping (_ image: Data?, _ error: Error?) -> Void)
    
}
