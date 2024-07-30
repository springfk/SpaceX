//
//  MissionsRespository.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation

final class MissionRepository: MissionsRepositoryInterface {
    
    let networkClient: ApiClient
    
    init(networkClient: ApiClient) {
        self.networkClient = networkClient
    }
    
    func getMissionLaunchesh(page: Int, size: Int, asceding: Bool, completion: @escaping (Result<Page<LaunchMission>, any Error>) -> Void) {
        do {
            let encoder = JSONEncoder()
            let paramEncoder = JSONAPIParamEncoder(encoder: encoder)
            let query = LaunchEndpointQuery(query: .init(upcoming: false),
                                            options: .init(limit: size, page: page, sort: .init(flight_number: asceding ? .ascending : .deascending)))
            let endpoint = LaunchNetworkRequest(path: LaunchAPIRoute.query.route,
                                                isFullPath: false,
                                                method: .post,
                                                bodyParametersEncodable: query,
                                                paramsEncoder: paramEncoder)
            try networkClient.request(endpoint: endpoint) { (result: Result<LaunchesResponse, APIError>) in
                let response = result.mapError { $0 as Error }
                switch response {
                case .success(let value):
                    completion(.success(value.toDomain()))
                case .failure(let err): completion(.failure(err))
                    
                }
            }
        } catch let error {
            completion(.failure(error))
        }
    }
    
}
