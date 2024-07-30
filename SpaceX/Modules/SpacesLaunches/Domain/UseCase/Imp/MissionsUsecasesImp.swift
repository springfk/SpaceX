//
//  MissionsUsecasesImp.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

final class MissionsUsecasesImp: MissionsUsecases {
    
    let repository : MissionsRepositoryInterface
    
    init(repository: MissionsRepositoryInterface) {
        self.repository = repository
    }
    
    func getLauches(page: Int, size: Int, sortAsc: Bool, completion: @escaping (Page<LaunchMission>?, (any Error)?) -> Void) {
        
        repository.getMissionLaunchesh(page: page, size: size, asceding: sortAsc) { result in
            switch result {
            case .success(let success):
                completion(success, nil)
            case .failure(let failure):
                completion(nil, failure)
            }
        }
    }
}
