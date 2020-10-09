//
//  Movie.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct Movie : Decodable {
    
    var Title = ""
    var Year = ""
    var Poster = ""
    var imdbID = ""
    // var Runtime = ""
    // var Genre = ""
    // var Plot = ""
    // var imdbRating = ""
    
    enum CodingKeys: String, CodingKey{
       
        case Title
        case Year
        case Poster
        case imdbID
    }
    
    init(from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse Title
        self.Title = try container.decode(String.self, forKey: .Title)
        
        // Parse Year
        self.Year = try container.decode(String.self, forKey: .Year)
        
        // Parse Poster
        self.Poster = try container.decode(String.self, forKey: .Poster)
        
        // Parse imdbID
        self.imdbID = try container.decode(String.self, forKey: .imdbID)
    }
}
