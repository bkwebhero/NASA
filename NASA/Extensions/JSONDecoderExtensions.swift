//
//  JSONDecoderExtensions.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation

extension JSONDecoder {
    
    func preview<T: Decodable>(type: T.Type, from jsonString: String) throws -> T {
        do {
            guard let jsonData = jsonString.data(using: .utf8) else {
                throw JSONDecoderError.invalidJson
            }
            return try JSONDecoder().decode(T.self, from: jsonData)
        } catch {
            throw error
        }
    }
    
}

enum JSONDecoderError: Error {
    case invalidJson
    case other(Error)
    
    static func map(_ error: Error) -> JSONDecoderError {
        return (error as? JSONDecoderError) ?? .other(error)
    }
}
