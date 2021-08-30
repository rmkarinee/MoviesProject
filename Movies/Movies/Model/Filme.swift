//
//  Movie.swift
//  ProjectIOS
//
//  Created by Karine Rodrigues on 27/08/21.
//
import UIKit

class Filme{
    
    var title: String!
    var description: String!
    var year: Int!
    var image: UIImage!
    
    
    init( title: String, description: String , year: Int, image: UIImage){
    
        self.title = title
        self.description = description
        self.year = year
        self.image = image
        
        
    }
    
}
