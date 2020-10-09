//
//  MovieData.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/9/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct MovieData : Decodable {
    
    var Rated = ""
    var Runtime = ""
    var Genre = ""
    var Plot = ""
    var imdbRating = ""
    
    enum CodingKeys: String, CodingKey {
        
        case Rated
        case Runtime
        case Genre
        case Plot
        case imdbRating
    }
    
    init (from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse Rated
        self.Rated = try container.decode(String.self, forKey: .Rated)
        
        // Parse Runtime
        self.Runtime = try container.decode(String.self, forKey: .Runtime)
        
        // Parse Genre
        self.Genre = try container.decode(String.self, forKey: .Genre)
        
        // Parse Plot
        self.Plot = try container.decode(String.self, forKey: .Plot)
        
        // Parse imdbRating
        self.imdbRating = try container.decode(String.self, forKey: .imdbRating)
    }
}
