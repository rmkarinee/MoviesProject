//
//  IMDBIntegration.swift
//  ProjectIOS
//
//  Created by Karine Rodrigues on 27/08/21.
//

import Foundation
import UIKit

class MovieServices{

    func getPopularMovieFromUrl(completion: @escaping (Page) -> Void){
        
        let session = URLSession.shared
        
        let url = URL(string: ServiceConstants.baseURL + "popular?api_key=" + ServiceConstants.apiKey + "&language=" + ServiceConstants.language + "&page=1")!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if error != nil {
                print("An request error occurred: \(String(describing: error))")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Status Code Error : \(String(describing: response))")
                return
            }
            
            
            do {
        
                let page = try JSONDecoder().decode(Page.self, from: data!)
                completion(page)
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }

        })

        task.resume()
        
    }
    
    func getPosterImage(posterPath: String, completion: @escaping (UIImage) -> Void){
        
        let session = URLSession.shared
        guard let url = URL(string: ServiceConstants.imageBaseURL + posterPath) else {return}

        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("An request error occurred: \(String(describing: error))")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }
            
        }
        
        task.resume()
        return
    }
}

struct ServiceConstants {
    static let apiKey: String = "38e89175a62e8680dfb4ade7ce733f0f"
    static let language: String = "pt-BR"
    static let baseURL: String = "https://api.themoviedb.org/3/movie/"
    static let imageBaseURL: String = "https://image.tmdb.org/t/p/w500"
}
