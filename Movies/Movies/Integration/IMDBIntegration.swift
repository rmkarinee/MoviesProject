//
//  IMDBIntegration.swift
//  ProjectIOS
//
//  Created by Karine Rodrigues on 27/08/21.
//

import Foundation
import UIKit

class IMDBIntegration{
    
    let apiKey: String = "38e89175a62e8680dfb4ade7ce733f0f"
    let language: String = "pt-BR"

    func getDataFromUrl(){
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=" + self.apiKey + "&language=" + self.language + "&page=1")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
        
    }

}
