//
//  MovieModel.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/9/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

protocol MovieModelDelegate {
    func setMovieData(movieData:MovieData)
}

class MovieModel {
    
    var delegate:MovieModelDelegate?
    
    func getMovieData () {
        
        // Create a URL
        let url = URL(string: Constants.MOVIE_DATA_API_URL + Constants.MOVIE_ID)
        
        // Validate it
        guard url != nil else {
            return
        }
        
        // Create session
        let session = URLSession.shared
        
        // Create data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check for errors and data
            guard error == nil && data != nil else {
                return
            }
            
            do {
                
                // Create a JSONDecoder
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieData.self, from: data!)
                
                
                DispatchQueue.main.async {
                        
                    self.delegate?.setMovieData(movieData: response)
                }
                dump(response)
            } catch {
                return
            }
        }
        
        // Resume data task
        dataTask.resume()
    }
}
