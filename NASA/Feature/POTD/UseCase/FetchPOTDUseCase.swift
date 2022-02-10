//
//  FetchPOTDUseCase.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import Foundation
import Combine

protocol FetchPOTDUseCaseProtocol {
    func invoke(for date: Date) -> AnyPublisher<PhotoOfTheDay, NetworkError>
}

class FetchPOTDUseCase: FetchPOTDUseCaseProtocol {
    // TO-DO: Unit tests
    func invoke(for date: Date) -> AnyPublisher<PhotoOfTheDay, NetworkError> {
        if let url = constructURL(date: date) {
            return APIService().makeNetworkRequest(url: url, responseType: PhotoOfTheDay.self)
        } else {
            return Result.Publisher(NetworkError.invalidURL).eraseToAnyPublisher()
        }
    }
    
    private func constructURL(date: Date) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nasa.gov"
        components.path = "/planetary/apod"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: "C9Zu9vHMVFuLCqMUr81vSu47R0xEoqprvBqQ0hGB"),
            URLQueryItem(name: "date", value: date.toString(format: "YYYY-MM-dd"))
        ]
        return components.url
    }
    
}
