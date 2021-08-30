//
//  ViewController.swift
//  Movies
//
//  Created by Karine Rodrigues on 27/08/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var filmes: [Filme] = []

    override func viewDidLoad() {
        
        let newJson = IMDBIntegration()
        newJson.getDataFromUrl()
        
        super.viewDidLoad()
        
        var filme: Filme
        
        filme = Filme(title: "007", description: "Descrição Filme 1", year: 2010, image: UIImage(named: "filme1")!)
        filmes.append(filme)
        filme = Filme(title: "Star Wars", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme2")!)
        filmes.append(filme)
        filme = Filme(title: "Impacto Mortal", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme3")!)
        filmes.append(filme)
        filme = Filme(title: "DeadPool", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme4")!)
        filmes.append(filme)
        filme = Filme(title: "O Regresso", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme5")!)
        filmes.append(filme)
        filme = Filme(title: "A Herdeira", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme6")!)
        filmes.append(filme)
        filme = Filme(title: "O Crime não tem limites", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme7")!)
        filmes.append(filme)
        filme = Filme(title: "Regresso do mal", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme8")!)
        filmes.append(filme)
        filme = Filme(title: "Tarzan", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme9")!)
        filmes.append(filme)
        filme = Filme(title: "Hardcore", description: "Descrição Filme 2", year: 2010, image: UIImage(named: "filme10")!)
        filmes.append(filme)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filmes.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let filme = filmes[indexPath.row]
        
        let celulaReuso = "celulaReuso"
        
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! MovieCell
        
        celula.movieImageView.image = filme.image
        celula.movieLabelTitle.text = filme.title
        celula.movieLabelDescription.text = filme.description
        
        
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
                let filmeSelecionado = self.filmes[ indexPath.row ]
                let viewControlleDestino = segue.destination as! DetalheFilmeViewController
                viewControlleDestino.filme = filmeSelecionado
                
            }
        }
    }

}

