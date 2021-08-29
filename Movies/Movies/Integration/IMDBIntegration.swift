//
//  IMDBIntegration.swift
//  ProjectIOS
//
//  Created by Karine Rodrigues on 27/08/21.
//

import Foundation
import UIKit

class IMDBIntegration{

    func initRequest(){
        
        let headers = [
            "x-rapidapi-host": "imdb8.p.rapidapi.com",
            "x-rapidapi-key": "9205aa15d6msh95a8664342e512ap16aeaajsn15fa4638babe"
        ]
        
        var request = URLRequest(url: NSURL(string: "https://imdb8.p.rapidapi.com/title/find?q=game%20of%20thr")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET";
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            _ = response as? HTTPURLResponse
            if let data = data {
                do {
                
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                    
                    
                    let results = jsonData["results"]
                    print("RESULTE:::: \(String(describing: results))")


                } catch {
                    print("JSON error: \(error.localizedDescription)")
                }
        }
        })

        dataTask.resume()
        return
        
    }

}
