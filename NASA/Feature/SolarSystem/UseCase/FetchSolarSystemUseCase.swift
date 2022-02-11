//
//  FetchSolarSystemUseCase.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation
import Combine

protocol FetchSolarSystemUseCaseProtocol {
    func invoke() -> AnyPublisher<SolarSystem, NetworkError>
}

class FetchSolarSystemUseCase: FetchSolarSystemUseCaseProtocol {
    func invoke() -> AnyPublisher<SolarSystem, NetworkError> {
        if let url = constructURL() {
            return APIService().makeNetworkRequest(url: url, responseType: SolarSystem.self)
        } else {
            return Result.Publisher(NetworkError.invalidURL).eraseToAnyPublisher()
        }
    }
    
    private func constructURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.le-systeme-solaire.net"
        components.path = "/rest/bodies"
        return components.url
    }
}
