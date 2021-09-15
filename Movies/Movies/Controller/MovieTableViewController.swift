//
//  MovieTableViewController.swift
//  Movies
//
//  Created by Karine Rodrigues on 14/09/21.
//

import Foundation
import UIKit

class MovieTableViewController: UIViewController{
    
    @IBOutlet weak var movieTableView: UITableView!
    
  
    var movies: [Movie] = []{
        didSet{
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        }
    }
    var page: Page?
    
    func completionService(page: Page){
        self.page = page
        self.movies = page.results
        print(movies)
    }
    
    override func viewDidLoad() {
        
        let _ = IMDBIntegration().getDataFromUrl(completion: completionService(page:))
        
        super.viewDidLoad()
        
    }
    
}
