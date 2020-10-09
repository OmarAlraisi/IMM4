//
//  Constants.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "994b3817"
    
    // This is to get movies related to the search
    static var SEARCH_WORD = ""
    static var API_URL = "http://www.omdbapi.com/?apikey=\(Constants.API_KEY)&type=movie&s="
    
    // This is to get movie data
    static var MOVIE_ID = ""
    static var MOVIE_DATA_API_URL = "http://www.omdbapi.com/?apikey=\(Constants.API_KEY)&plot=full&i=" // + \(Constants.MOVIE_ID)"
}

/*http://www.omdbapi.com/?apikey=994b3817&type=movie&s=star*/
