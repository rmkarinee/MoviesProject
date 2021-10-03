//
//  Movie.swift
//  ProjectIOS
//
//  Created by Karine Rodrigues on 27/08/21.
//
import UIKit

struct Page: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    
    var title: String?
    var overview: String?
    var year: Int?
    var poster_path:String?
    var vote_average: Float?
    var vote_count: Int?

}
    
