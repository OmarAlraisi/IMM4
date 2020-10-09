//
//  Model.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    // Delegate function
    func moviesFetched (_ feed:[Movie])
    
}

class Model {
    
    var delegate:ModelDelegate?
    
    func getSearchFeed () {
        
        // Create a URL
        let url = URL(string: Constants.API_URL + Constants.SEARCH_WORD)
        
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
            
            // Create a JSONDecoder
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MoviesResponse.self, from: data!)
                
                if response.Search != nil {
                    
                    // To run on the main thread
                    DispatchQueue.main.async {
                        
                        // Call the delegate method
                        self.delegate?.moviesFetched(response.Search!)
                    }
                }
                dump(response)
            } catch {
                print("")
            }
        }
        
        // Resume data task
        dataTask.resume()
        
        // TODO: Call Decode each movie
    }
    
    func getMovieData () {
        
    }
}
