//
//  APIService.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/9/22.
//

import Foundation
import Combine

class APIService {
    
    // TO-DO: Make protocol
    // TO-DO: Unit tests
    func makeNetworkRequest<T: Decodable>(url: String, responseType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: url) else {
            return Result.Publisher(NetworkError.invalidURL).eraseToAnyPublisher()
        }

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
                throw NetworkError.statusCode
            }
            return response.data
          }
          .decode(type: T.self, decoder: JSONDecoder())
          .mapError { NetworkError.map($0) }
          .eraseToAnyPublisher()
    }
    
}

enum NetworkError: Error {
  case statusCode
  case decoding
  case invalidResponse
  case invalidURL
  case other(Error)
  
  static func map(_ error: Error) -> NetworkError {
    return (error as? NetworkError) ?? .other(error)
  }
}
