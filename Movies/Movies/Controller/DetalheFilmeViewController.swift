//
//  DetalheFilme.swift
//  Movies
//
//  Created by Karine Rodrigues on 27/08/21.
//

import Foundation
import UIKit

class DetalheFilmeViewController: UIViewController{
    
    
    @IBOutlet weak var detalheImageView: UIImageView!
    @IBOutlet weak var detalheLabelTitulo: UILabel!
    @IBOutlet weak var detalheLabelDescricao: UILabel!
    
    var filme: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        detalheImageView.image = movie.image
        detalheLabelTitulo.text = filme.title
        detalheLabelDescricao.text = filme.overview
        
    }
    
    
}
