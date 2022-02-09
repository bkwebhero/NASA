//
//  FetchPOTDUseCase.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import Foundation
import Combine

protocol FetchPOTDUseCaseProtocol {
    func invoke() -> AnyPublisher<PhotoOfTheDay, ImageError>
}

class FetchPOTDUseCase: FetchPOTDUseCaseProtocol {
    
    // TO-DO: Unit tests
    func invoke() -> AnyPublisher<PhotoOfTheDay, ImageError> {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=C9Zu9vHMVFuLCqMUr81vSu47R0xEoqprvBqQ0hGB")!

        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)

        let urlRequest = URLRequest(url: url)

        return session.dataTaskPublisher(for: urlRequest)
          .tryMap { response -> Data in
            guard
              let httpURLResponse = response.response as? HTTPURLResponse,
              httpURLResponse.statusCode == 200
              else {
                throw ImageError.statusCode
            }
            return response.data
          }
          .decode(type: PhotoOfTheDay.self, decoder: JSONDecoder())
          .mapError { ImageError.map($0) }
          .eraseToAnyPublisher()
    }
    
}

enum ImageError: Error {
  case statusCode
  case decoding
  case invalidImage
  case invalidURL
  case other(Error)
  
  static func map(_ error: Error) -> ImageError {
    return (error as? ImageError) ?? .other(error)
  }
}
