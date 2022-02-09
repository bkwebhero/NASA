//
//  FetchPOTDUseCase.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import Foundation
import Combine

protocol FetchPOTDUseCaseProtocol {
    func invoke() -> AnyPublisher<PhotoOfTheDay, NetworkError>
}

class FetchPOTDUseCase: FetchPOTDUseCaseProtocol {
    // TO-DO: Unit tests
    func invoke() -> AnyPublisher<PhotoOfTheDay, NetworkError> {
        return APIService()
            .makeNetworkRequest(url: "https://api.nasa.gov/planetary/apod?api_key=C9Zu9vHMVFuLCqMUr81vSu47R0xEoqprvBqQ0hGB",
                                responseType: PhotoOfTheDay.self)
    }
    
}
