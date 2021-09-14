//
//  ViewController.swift
//  Movies
//
//  Created by Karine Rodrigues on 27/08/21.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet var movieTableView: UITableView!
    
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
        
//        let newJson = IMDBIntegration()
//        newJson.getDataFromUrl(){ page in
//            self.page = page
//        }
        
        let result = IMDBIntegration().getDataFromUrl(completion: completionService(page:))
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        super.viewDidLoad()
        
        
//        filme = Filme(title: "007", description: "Descrição Filme 1", year: 2010, image: UIImage(named: "filme1")!)
//        filmes.append(filme)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! MovieCell
        
        //celula.movieImageView.image = filme.image
        celula.movieLabelTitle.text = movie.title
        celula.movieLabelDescription.text = movie.overview
        
        
        /*
        Arredondar as cordas e cortar para as bordas
        celula.layer.cornerRadius = 20
        celula.clipsToBounds = true
        */
        
//        celula.textLabel?.text = filme.titulo
//        celula.imageView?.image = filme.imagem
//
        return celula
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsMovie"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                let filmeSelecionado = self.movies[ indexPath.row ]
                let viewControlleDestino = segue.destination as! DetalheFilmeViewController
                viewControlleDestino.filme = filmeSelecionado
                
            }
        }
    }

}

