//
//  MovieDatabase.swift
//  FlixV2
//
//  Created by Madel Asistio on 11/17/17.
//  Copyright © 2017 Madel Asistio. All rights reserved.
//

import Foundation

class MovieDatabase {
    
    func getMovieLibrary(completion: @escaping (_ movieCollection: [Movie]) -> Void) {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // run when network request returns
            // asynchronous
            
            if error != nil {
                
            } else if let data = data {
                var movies: [Movie] = []
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                // key is string but value can be anything
                let moviesDict = dataDictionary["results"] as? [[String: Any]]
                
                for movie in moviesDict! {
                    let title = movie["title"] as! String
                    let overview = movie["overview"] as! String
                    let posterPathStr = movie["poster_path"] as! String
                    let baseURLString = "https://image.tmdb.org/t/p/w500"
                    let posterURL = URL(string: baseURLString + posterPathStr)!
                    
                    let currMovie = Movie(title: title, posterURL:posterURL, overview: overview)
                    
                    movies.append(currMovie)
                    
                }
                
                completion(movies)
                
                // array of dictionaries
                
                /*
                for movie in movies {
                    let title = movie["title"] as! String
                    print(title)
                } */
                //   print(dataDictionary)
            }
        }
        task.resume()
        
    }
    
    func getTitle(from movie: [String: Any]) -> String {
        return movie["title"] as! String
    }
    
    func getDescription(from movie: [String: Any]) -> String {
        return movie["title"] as! String
    }
}
