//
//  Service.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func fetchTVEpisodes(showId: Int, seasonNumber: Int, completion: @escaping (Result<EpisodesResponse, Error>) -> () ) {
        
    }
    
    func fetchTVSeason(id: Int, completion: @escaping (Result<TVSeason, Error>) -> () ) {
        let urlString = "https://api.themoviedb.org/3/tv/\(id)?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        print(urlString)
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchGenreList(completion: @escaping (Result<GenreResponse, Error>) -> () ) {
        let urlString = "https://api.themoviedb.org/3/genre/tv/list?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchComingSoon(completion: @escaping (Result<APIResponse, Error>) -> () ) {
        let urlString = "https://api.themoviedb.org/3/tv/airing_today?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchBannerShows(completion: @escaping (Result<APIResponse, Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/search/tv?api_key=8708e6e442f4c7d558ae6aa51d79152b&page=1&query=star%20wars"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchContinueWatching(completion: @escaping (Result<APIResponse, Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/search/tv?api_key=8708e6e442f4c7d558ae6aa51d79152b&page=1&query=the"
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchPopularShows(completion: @escaping (Result<APIResponse, Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/popular?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchTopRatedShows(completion: @escaping (Result<APIResponse, Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/top_rated?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchOnTheAirShows(completion: @escaping (Result<APIResponse, Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/on_the_air?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        
        fetchData(urlString: urlString, completion: completion)
    }
    
    func fetchData<T: Codable>(urlString: String, completion: @escaping (Result<T, Error>) -> () ) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    return
                }
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let results = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            }
            
            catch let error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
        }.resume()
    }
    
}
