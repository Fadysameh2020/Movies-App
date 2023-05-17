//
//  ViewController.swift
//  Movies APP
//
//  Created by MESHO on 14/05/2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieRealeaseDate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    var movie = Movie()
    var movieID: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        movieID = String(Int(movie.id ?? 0))
        movieName.text = movie.title
        movieRate.text = String(Double(movie.vote_average ?? 0.0))
        movieRealeaseDate.text = movie.release_date
        movieOverview.text = movie.overview
//        moviePosterImage.kf.setImage(with: URL(string: movie.poster_path!))
        
        moviePosterImage.layer.cornerRadius = 80
        navigationItem.title = movie.title
    }


}

