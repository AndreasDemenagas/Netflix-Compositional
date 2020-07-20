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
    let total_results: Int
    let total_pages: Int
    let results: [TVShow]
}

struct TVShow: Codable, Hashable {
    let id: Int
    let poster_path: String?
    let name: String?
    let overview: String?
    let backdrop_path: String?
    let genre_ids: [Int]?
    let first_air_date: String?
    
    func getFirstAirDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let dateString = self.first_air_date else {
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
