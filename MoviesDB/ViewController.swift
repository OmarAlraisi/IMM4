//
//  ViewController.swift
//  MoviesDB
//
//  Created by Omar Al Raisi on 10/8/20.
//  Copyright © 2020 Omar Al Raisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {
    
    // Create a model variable
    var model = Model()
    
    // Create a variable to hold the movies
    var feed = [Movie]()
    
    // Link UI elements
    @IBOutlet weak var searchButtonView: UIButton!
    @IBOutlet weak var waitLabelView: UILabel!
    @IBOutlet weak var showResultButtonView: UIButton!
    @IBOutlet weak var searchText: UITextField!
    
    // For the wait label
    var timeLeft = 0
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Edit searchButtonView corners
        searchButtonView.layer.cornerRadius = 20
        waitLabelView.layer.cornerRadius = 20
        showResultButtonView.layer.cornerRadius = 20
        
        // Disable showResultsButton
        showResultButtonView.alpha = 0
        
        // Set model delegate to the view controller
        model.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        // Reset searchText
        searchText.text = ""
            
        // Change buttons for when the user pres back
        searchButtonView.alpha = 1
        waitLabelView.alpha = 1
        
        // Hide showResultsButtonView
        showResultButtonView.alpha = 0
            
        let moviesGridVC = segue.destination as! MoviesListViewController
            
        moviesGridVC.movies = feed
            
        feed.removeAll()
    }
    
    func moviesFetched(_ feed: [Movie]) {
        
        self.feed = feed
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
        // Set the search word
        Constants.SEARCH_WORD = searchText.text!
        
        // Get the movies found
        model.getSearchFeed()
        
        // Reset search word
        Constants.SEARCH_WORD = ""
        
        // Hide this button
        searchButtonView.alpha = 0
        
        // Set timeLeft to 3
        timeLeft = 1
        
        // TODO: Add timer to update wait label
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateWaitLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateWaitLabel () {
        
        if timeLeft == 0 {
            
            // Terminate the timer
            timer?.invalidate()
            
            // Hide wait label
            waitLabelView.alpha = 0
            
            // Show showResultsButtonView
            showResultButtonView.alpha = 1
            
            // Reset wait label
            waitLabelView.text = "صبر ثانيتين"
        }
        else {
            
            // Update wait label
            waitLabelView.text = "صبر ثانية"
            
            // Decrement timeLeft
            timeLeft -= 1
        }
    }
    
}

