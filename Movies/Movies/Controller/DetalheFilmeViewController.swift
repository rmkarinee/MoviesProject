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
    
    var filme: Filme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detalheImageView.image = filme.image
        detalheLabelTitulo.text = filme.title
        detalheLabelDescricao.text = filme.description
        
    }
    
    
}
