//
//  TVEpisode.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 21/8/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import Foundation

struct EpisodesResponse: Codable {
    let id: String
    let airDate: String
    let episodes: [TVEpisode]
}

struct TVEpisode: Codable {
    let name: String
    let overview: String
    let episodeNumber: String
    let stillPath: String
}
