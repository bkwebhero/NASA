//
//  SolarSystem.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation

// https://api.le-systeme-solaire.net/rest/bodies/

struct SolarSystem: Codable {
    let bodies: [Body]?
}

struct Planets: Codable {
    let bodies: [Body]?
}

extension SolarSystem {
    var planets: [Body] {
        return bodies?.filter{ $0.isPlanet ?? false } ?? []
    }
}
