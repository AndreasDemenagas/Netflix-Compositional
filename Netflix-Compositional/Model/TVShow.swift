//
//  PopularShows.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [TVShow]
}

struct TVShow: Codable, Hashable {
    let id: Int
    let posterPath: String?
    let name: String?
    let overview: String?
    let backdropPath: String?
    let genre_ids: [Int]?
    let firstAirDate: String?
    
    func getFirstAirDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let dateString = self.firstAirDate else {
            return ""
        }
        
        if let date = formatter.date(from: dateString) {
            let stringFormatter = DateFormatter()
            stringFormatter.dateFormat = "MMMM dd, yyyy"
            return "\(stringFormatter.string(from: date))"
        }
        
        return ""
    }
}
