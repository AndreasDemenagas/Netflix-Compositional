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
    
    fileprivate let base_url = "https://api.themoviedb.org/3/"
    fileprivate let api_key = "?api_key=8708e6e442f4c7d558ae6aa51d79152b"
    
    func fetchPopularShows(completion: @escaping (Result<PopularShowsResponse, Error>) -> ()) {
        let urlString = "https://api.themoviedb.org/3/tv/popular?api_key=8708e6e442f4c7d558ae6aa51d79152b"
        
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
            
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
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
