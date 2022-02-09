//
//  PhotoOfTheDay.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/8/22.
//

import Foundation

struct PhotoOfTheDay: Codable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String?
    let url: String?
}

extension PhotoOfTheDay {
    var urlParsed: URL? {
        guard let url = self.url else { return nil }
        return URL(string: url)
    }
}
