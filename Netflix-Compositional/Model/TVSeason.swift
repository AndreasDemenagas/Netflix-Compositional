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
    let voteAverage: Double
    let posterPath: String
    
    let lastEpisodeToAir: TVEpisode
    
    func getFirstAirYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
    
        if let date = formatter.date(from: self.firstAirDate) {
            let stringFormatter = DateFormatter()
            stringFormatter.dateFormat = "yyyy"
            return "\(stringFormatter.string(from: date))"
        }
        
        return ""
    }
}
