//
//  Model.swift
//  Movies APP
//
//  Created by MESHO on 14/05/2023.
//

import Foundation

class Movie : Decodable{
    var id: Int?
    var vote_average: Double?
    var title: String?
    var poster_path: String?
    var overview: String?
    var release_date: String?
}

class MyResult : Decodable{
    var results: [Movie]?
    var page: Int?
    var total_pages: Int?
    var total_results: Int?
}

func fetchResult(complitionHandler: @escaping (MyResult?) -> Void){
    
    let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=fdbde11438b838998dd5d98eea5ec77a&language=en-US&page=1")
    guard let newUrl = url else{
        return
    }
    let request = URLRequest(url: newUrl)
    let session = URLSession(configuration: .default)
    
    let task = session.dataTask(with: request) { (data, response, error) in
        guard let data = data else{
            complitionHandler(nil)
            return
        }
        do{

            let result = try JSONDecoder().decode(MyResult.self, from: data)
            complitionHandler(result)
            
        }catch let error{
            print("error")
            print(error.localizedDescription)
            complitionHandler(nil)
        }
    }
    task.resume()
}
