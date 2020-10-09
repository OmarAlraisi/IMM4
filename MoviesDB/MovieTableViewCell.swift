//
//  MovieTableViewCell.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // Link cell attributes
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell (_ movie : Movie) {
        
        // Set movie title
        movieTitleLabel.text = movie.Title
        
        // Set movie releas year
        movieReleaseLabel.text = "مسواي سنة: " + movie.Year
        
        // Check if the image is already downloaded
        let cache = CacheManager()
        let poster = cache.retriveImage(movie.Poster)
        if poster != nil {
            
            // Set the image again
            movieImageView.image = UIImage(data: poster!)
        }
        // Image doesn't exist in the cache
        else {
            
            // Download image
            // Create url
            let url = URL(string: movie.Poster)
            
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
                
                // Store the image in the cache
                cache.saveImage(data!, movie.Poster)
                
                let moviePoster = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    
                    // Set movie poster
                    self.movieImageView.image = moviePoster
                }
            }
            
            // Resume data task
            dataTask.resume()
        }
    }
}
