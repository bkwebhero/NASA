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
