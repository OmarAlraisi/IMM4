//
//  MovieDescriptionViewController.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/9/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class MovieDescriptionViewController: UIViewController, MovieModelDelegate {
    
    // Link UI elements
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ageRatingLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    
    var movieModel = MovieModel()
    var movieData:MovieData?
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieModel.getMovieData()
        movieModel.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func setMovieData(movieData:MovieData) {
        self.movieData = movieData
        
        DispatchQueue.main.async {
            
            // Set the UI elemnts
            // Check if poster exist in the cache
            let cache = CacheManager()
            if cache.retriveImage(self.movie!.Poster) != nil {
                self.posterImageView.image = UIImage(data: cache.retriveImage(self.movie!.Poster)!)
            }
            // If not, then download
            else {
                
                // Create URL
                let url = URL(string: self.movie!.Poster)
                
                // Validate it
                guard url != nil else {
                    return
                }
                
                // Create session
                let session = URLSession.shared
                
                // Create dataTask
                let dataTask = session.dataTask(with: url!) { (data, response, error) in
                    
                    // Check for errors
                    guard error == nil && data != nil else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.posterImageView.image = UIImage(data: data!)
                        cache.saveImage(data!, self.movie!.Poster)
                    }
                }
                
                // Resume dataTask
                dataTask.resume()
            }
            
            // Set title
            self.titleLabel.text = self.movie!.Title
            
            // Set genre
            self.genreLabel.text = "مال: " + self.movieData!.Genre
            
            // Set runtime
            self.runtimeLabel.text = "طوله: " + self.movieData!.Runtime
            
            // Set rating
            self.ratingLabel.text = "تقييمه: " + self.movieData!.imdbRating
            
            // Set age rating
            // Check age ratings
            var ageRatingString = ""
            if movieData.Rated == "G" {
                
                ageRatingString = "أموره طيبة الفلم حال أطفال"
            }
            else if movieData.Rated == "PG" || movieData.Rated == "PG-13"{
                
                ageRatingString = "عادي أطفال يشوفوه لاكن مع حد كبير"
            }
            else if movieData.Rated == "R" {
                
                ageRatingString = "الفلم ما حال صغار"
            }
            else if movieData.Rated == "NC-17" {
                
                ageRatingString = "فلم ماصخ و أنت قليل أدب إذا تشوفه"
            }
            
            self.ageRatingLabel.text = ageRatingString
            
            // Set plot
            self.plotTextView.text = "عن مو: " + self.movieData!.Plot
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
