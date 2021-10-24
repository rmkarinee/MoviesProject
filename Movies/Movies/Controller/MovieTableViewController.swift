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
        
        let _ = MovieServices().getPopularMovieFromUrl(completion: completionService(page:))
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        movieTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "reusableMovieCell")
        
        super.viewDidLoad()
        
    }
    
}

extension MovieTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableMovieCell", for: indexPath) as! MoviesTableViewCell
        
        
        cell.descriptionMovieTableView.text = movie.overview
        cell.titleMovieTableView.text = movie.title
        
        MovieServices().getPosterImage(posterPath: movie.poster_path!) { image in
            DispatchQueue.main.async {
                cell.imageMovieTableView.image = image
            }
        }

        cell.imageMovieTableView.layer.cornerRadius = 20
        cell.imageMovieTableView.clipsToBounds = true

        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsMovie"{
            
            if let indexPath = movieTableView.indexPathForSelectedRow{
                let filmeSelecionado = self.movies[ indexPath.row ]
                let viewControlleDestino = segue.destination as! DetalheFilmeViewController
                viewControlleDestino.filme = filmeSelecionado
                
            }
        }
    }
}
