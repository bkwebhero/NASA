//
//  CelestialBodyView.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import SwiftUI

struct CelestialBodyView: View {
    
    var celestialBody: Body
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(celestialBody.englishName ?? "No name")
                .font(.title)
            if let id = celestialBody.englishName?.lowercased(), let _ = UIImage(named: id) {
                Image(id)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.leading, .trailing], -16)
            }
            if let perihelion = celestialBody.perihelion {
                StatisticView(key: "Distance from sun", value: "\(perihelion) km")
            }
            if let gravity = celestialBody.gravity {
                StatisticView(key: "Gravity", value: "\(gravity.removeZerosFromEnd()) m/s\(2.superscriptString)")
            }
            if let massBase = celestialBody.mass?.massValue, let massPower = celestialBody.mass?.massExponent {
                StatisticView(key: "Mass", value: "\(massBase.removeZerosFromEnd()) x 10\(massPower.superscriptString) kg")
            }
            if let volumeBase = celestialBody.vol?.volValue, let volumePower = celestialBody.vol?.volExponent {
                StatisticView(key: "Volume", value: "\(volumeBase.removeZerosFromEnd()) x 10\(volumePower.superscriptString) km\(3.superscriptString)")
            }
            if celestialBody.isPlanet ?? false {
                StatisticView(key: "Moons", value: "\(celestialBody.moonCount)")
            }
            if let discoveryDetails = celestialBody.discoveryDetails {
                Text(discoveryDetails)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.footnote)
                    .padding(.top)
            }
        }
    }
}

struct StatisticView: View {
    
    var key: String
    var value: String
    
    var body: some View {
        HStack {
            Text(key)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
            Text(value)
                .font(.subheadline)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
}

struct CelestialBodyView_Previews: PreviewProvider {
    static var previews: some View {
        let jsonString = """
        {
              "id": "uranus",
              "name": "Uranus",
              "englishName": "Uranus",
              "isPlanet": true,
              "moons": [
                {
                  "moon": "Ariel",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/ariel"
                },
                {
                  "moon": "Umbriel",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/umbriel"
                },
                {
                  "moon": "Titania",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/titania"
                },
                {
                  "moon": "Obéron",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/oberon"
                },
                {
                  "moon": "Miranda",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/miranda"
                },
                {
                  "moon": "Cordélia",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/cordelia"
                },
                {
                  "moon": "Ophélie",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/ophelia"
                },
                {
                  "moon": "Bianca",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/bianca"
                },
                {
                  "moon": "Cressida",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/cressida"
                },
                {
                  "moon": "Desdémone",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/desdemona"
                },
                {
                  "moon": "Juliette",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/juliet"
                },
                {
                  "moon": "Portia",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/portia"
                },
                {
                  "moon": "Rosalinde",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/rosalind"
                },
                {
                  "moon": "Belinda",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/belinda"
                },
                {
                  "moon": "Puck",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/puck"
                },
                {
                  "moon": "Caliban",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/caliban"
                },
                {
                  "moon": "Sycorax",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/sycorax"
                },
                {
                  "moon": "Prospero",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/prospero"
                },
                {
                  "moon": "Setebos",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/setebos"
                },
                {
                  "moon": "Stephano",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/stephano"
                },
                {
                  "moon": "Trinculo",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/trinculo"
                },
                {
                  "moon": "Francisco",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/francisco"
                },
                {
                  "moon": "Margaret",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/margaret"
                },
                {
                  "moon": "Ferdinand",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/ferdinand"
                },
                {
                  "moon": "Perdita",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/perdita"
                },
                {
                  "moon": "Mab",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/mab"
                },
                {
                  "moon": "Cupid",
                  "rel": "https://api.le-systeme-solaire.net/rest/bodies/cupid"
                }
              ],
              "semimajorAxis": 2870658186,
              "perihelion": 2734998229,
              "aphelion": 3006318143,
              "eccentricity": 0.0457,
              "inclination": 0.772,
              "mass": {
                "massValue": 8.68127,
                "massExponent": 25
              },
              "vol": {
                "volValue": 6.833,
                "volExponent": 13
              },
              "density": 1.27,
              "gravity": 8.87,
              "escape": 21380,
              "meanRadius": 25362,
              "equaRadius": 25559,
              "polarRadius": 24973,
              "flattening": 0.02293,
              "dimension": "",
              "sideralOrbit": 30685.4,
              "sideralRotation": -17.24,
              "aroundPlanet": null,
              "discoveredBy": "William Herschel",
              "discoveryDate": "13/03/1781",
              "alternativeName": "",
              "axialTilt": 97.77,
              "avgTemp": 76,
              "mainAnomaly": 142.2386,
              "argPeriapsis": 98.862,
              "longAscNode": 73.967,
              "bodyType": "Planet",
              "rel": "https://api.le-systeme-solaire.net/rest/bodies/uranus"
            }
        """
        if let previewData = try? JSONDecoder().preview(type: Body.self, from: jsonString) {
            CelestialBodyView(celestialBody: previewData)
                .previewLayout(.sizeThatFits)
        }
    }
}
