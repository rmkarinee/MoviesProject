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

    func getDataFromUrl(completion: @escaping (Page) -> Void){
        
        let session = URLSession.shared
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=" + self.apiKey + "&language=" + self.language + "&page=1")!
        
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

}
