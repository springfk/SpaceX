//
//  MIssionListItemViewModel.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation
import UIKit


protocol MissionListItemViewModel {
    
    var name: String { get }
    var details: String { get }
    var sucessStatus: String { get }
    var date: String {  get }
    var flightNumber: String { get }
    
    func getIconImage(completion:@escaping (_ image: UIImage?) -> Void)
    
}

struct DefaultMissionListItemViewCell: MissionListItemViewModel {
    
    
    var sucessStatus: String {
        entity.success ? "sucessed" : "failed"
    }
    
    var flightNumber: String {
        "\(entity.flightNumber)"
    }
    
    var isSuccessfull: Bool {
        entity.success
    }
    
    var name: String {
        entity.name
    }
    
    var date: String = ""
    
    var details: String {
        entity.details ?? "No details"
    }
    
    
    let imageUsecase: ImageUseCase
    let entity: LaunchMission
    
    init(entity: LaunchMission,
         imageUsecase: ImageUseCase) {
        self.imageUsecase = imageUsecase
        self.entity = entity
        
        date = convertUnixToDate(entity.date_Unix)
    }
    
    func getIconImage(completion: @escaping (UIImage?) -> Void) {
        let url = entity.links.patch.small
        guard let urlImage = URL(string: url) else {
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
}
