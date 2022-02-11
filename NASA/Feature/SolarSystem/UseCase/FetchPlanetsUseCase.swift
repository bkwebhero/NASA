//
//  FetchPlanetsUseCase.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation
import Combine

protocol FetchPlanetsUseCaseProtocol {
    func invoke() -> AnyPublisher<Planets, NetworkError>
}

class FetchPlanetsUseCase: FetchPlanetsUseCaseProtocol {
    func invoke() -> AnyPublisher<Planets, NetworkError> {
        if let url = constructURL() {
            return APIService().makeNetworkRequest(url: url, responseType: Planets.self)
        } else {
            return Result.Publisher(NetworkError.invalidURL).eraseToAnyPublisher()
        }
    }
    
    private func constructURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.le-systeme-solaire.net"
        components.path = "/rest/bodies"
        components.queryItems = [
            URLQueryItem(name: "filter[]", value: "isPlanet,eq,true")
        ]
        return components.url
    }
}
