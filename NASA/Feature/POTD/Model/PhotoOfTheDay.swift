//
//  PhotoOfTheDay.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import Foundation

struct PhotoOfTheDay: Codable {
    var copyright, date, explanation: String?
    let hdurl: String?
    let mediaType, serviceVersion, title: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType
        case serviceVersion
        case title, url
    }
}
