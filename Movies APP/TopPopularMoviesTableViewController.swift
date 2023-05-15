//
//  TopPopularMoviesTableViewController.swift
//  Movies APP
//
//  Created by MESHO on 14/05/2023.
//

import UIKit
import Kingfisher

class TopPopularMoviesTableViewController: UITableViewController {

    var moviesList: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        fetchResult(){ myresult in
            DispatchQueue.main.async {
                self.moviesList = myresult?.results
                self.tableView.reloadData()
                indicator.stopAnimating()
                
            }
            
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return moviesList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        
//        let temp: Movies = moviesList[indexPath.row]
        cell.textLabel?.text = moviesList?[indexPath.row].title
        cell.detailTextLabel?.text = String(moviesList?[indexPath.row].vote_average ?? 0)
        cell.imageView?.kf.setImage(with: URL(string: (moviesList?[indexPath.row].poster_path) ?? ""))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: MovieDetailsViewController = self.storyboard!.instantiateViewController(withIdentifier: "movie") as! MovieDetailsViewController
//        vc.movie = (moviesList?[indexPath.row])!
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Movies"
    }

}
