//
//  TVSeason.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 21/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import Foundation

struct TVSeason: Codable {
    let id: Int
    let backdropPath: String
    let name: String
    let numberOfSeasons: Int
    let firstAirDate: String
    let voteAverage: Int
    let posterPath: String
}