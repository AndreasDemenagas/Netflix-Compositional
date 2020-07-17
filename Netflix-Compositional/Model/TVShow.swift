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
    let backdrop_path: String?
}
