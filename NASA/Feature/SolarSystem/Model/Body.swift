//
//  Body.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation

struct Body: Codable {
    let id, name, englishName: String?
    let isPlanet: Bool?
    let moons: [Moon]?
    let semimajorAxis, perihelion, aphelion: Int?
    let eccentricity, inclination: Double?
    let mass: Mass?
    let vol: Vol?
    let density, gravity, escape, meanRadius: Double?
    let equaRadius, polarRadius, flattening: Double?
    let dimension: String?
    let sideralOrbit, sideralRotation: Double?
    let aroundPlanet: AroundPlanet?
    let discoveredBy, discoveryDate, alternativeName: String?
    let axialTilt: Double?
    let avgTemp: Int?
    let mainAnomaly, argPeriapsis, longAscNode: Double?
    let bodyType: BodyType?
    let rel: String?
}

struct AroundPlanet: Codable {
    let planet: String?
    let rel: String?
}

enum BodyType: String, Codable {
    case asteroid = "Asteroid"
    case comet = "Comet"
    case dwarfPlanet = "Dwarf Planet"
    case moon = "Moon"
    case planet = "Planet"
    case star = "Star"
}

struct Mass: Codable {
    let massValue: Double?
    let massExponent: Int?
}

struct Moon: Codable {
    let moon: String?
    let rel: String?
}

struct Vol: Codable {
    let volValue: Double?
    let volExponent: Int?
}
