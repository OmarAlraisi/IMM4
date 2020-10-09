//
//  CacheManager.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import Foundation

class CacheManager {
    
    var posters = [String : Data]()
    
    // To store the image
    func saveImage (_ poster: Data, _ posterURL: String) {
        
        posters[posterURL] = poster
    }
    
    // To retrieve the image
    func retriveImage (_ posterURL: String) -> Data? {
        
        return posters[posterURL]
    }
}
