//
//  MoviesResponse.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

struct MoviesResponse : Decodable {
    
    var Search:[Movie]?
    
    enum CodingKeys: String, CodingKey {
        case Search
    }
    
    init(from decoder: Decoder) throws {
        
        // Create container
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.Search = try container.decode([Movie].self, forKey: .Search)
    }
}
