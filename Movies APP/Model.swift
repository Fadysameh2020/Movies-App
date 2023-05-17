//
//  Model.swift
//  Movies APP
//
//  Created by MESHO on 14/05/2023.
//

import Foundation

class Movie : Decodable{
    var id : String?
    var rank : String?
    var title : String?
    var image : String?
    var weekend : String?
    var gross : String?
    var weeks : String?
}

class MyResult : Decodable{
    var items : [Movie]
    var errorMessage : String?
}

func fetchResult(complitionHandler: @escaping (MyResult?) -> Void){
    
    let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_30uvhodk")
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
