//
//  Genre.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 19/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let id: Int
    let name: String
}

struct GenreResponse: Codable {
    let genres: [Genre]
}

class GenreBank {
    
    var genres: [Genre] = [] {
        didSet {
            genres.forEach { (genre) in
                dictionary[genre.id] = genre.name
            }
        }
    }
    
    var dictionary: [Int: String] = [:]
    
    init() {
        Service.shared.fetchGenreList { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print("Error fetching genre list...", error)
            case .success(let response):
                self.genres = response.genres
            }
        }
    }
    
}
