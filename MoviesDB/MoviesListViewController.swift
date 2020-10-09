//
//  MoviesListViewController.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Connect UI elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalResultLabel: UILabel!
    
    // Create a variable to hold the movies
    var movies = [Movie]()
    var numberOfResults = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set dataSource and delegate to self
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set the number of results found
        numberOfResults = movies.count
        
        // Set results label
        if numberOfResults == 0 {
            
            totalResultLabel.text = "ماشي أفلام كتب شي ثاني"
        }
        else {
        
            totalResultLabel.text = "حصلنالك \(numberOfResults) أفلام"
        }
        
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO : COMPLETE!!
        
        //Check a cell have been selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        Constants.MOVIE_ID = movies[tableView.indexPathForSelectedRow!.row].imdbID
        
        // Get refernece to the sellected movie
        let sellectedMovie = movies[tableView.indexPathForSelectedRow!.row]
        
        // Create variable of type MovieDescriptionViewController
        let movieDescriptionVC = segue.destination as! MovieDescriptionViewController
        
        // Pass the movie to the MovieDescriptionViewController
        movieDescriptionVC.movie = sellectedMovie
    }

    
    // MARK: - Table Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        // Configure it
        cell.configureCell(movies[indexPath.row])
        
        // Return it
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
}
