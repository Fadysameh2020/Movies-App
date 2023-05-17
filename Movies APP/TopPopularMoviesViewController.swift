//
//  TopPopularMoviesViewController.swift
//  Movies APP
//
//  Created by MESHO on 15/05/2023.
//

import UIKit
import Kingfisher

class TopPopularMoviesViewController: UIViewController {

    
    @IBOutlet weak var SearchBar: UISearchBar! {
        didSet{
            SearchBar.delegate = self
        }
    }
    
    @IBOutlet weak var MoviesCollectionView: UICollectionView! {
        didSet{
            MoviesCollectionView.delegate = self
            MoviesCollectionView.dataSource = self
        }
    }
    
    var moviesArray: [Movie]?
    var searchArray: [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        MoviesCollectionView.register(nib, forCellWithReuseIdentifier: "movieCell")
        
        navigationItem.title = "Top Movies"
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
        
        fetchResult(){ myresult in
            DispatchQueue.main.async {
                self.moviesArray = myresult?.items
                self.searchArray = myresult?.items
                self.MoviesCollectionView.reloadData()
                indicator.stopAnimating()
            }
        }

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        MoviesCollectionView.reloadData()
    }

}

// MARK: - Collection View
extension TopPopularMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MoviesCollectionView.frame.width / 2 - 8, height: MoviesCollectionView.frame.height / 3 + 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        cell.MovieTitle_Label.text = moviesArray?[indexPath.row].title
        cell.MovieImageView?.kf.setImage(with: URL(string: (moviesArray?[indexPath.row].image)!))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc: ViewController = self.storyboard!.instantiateViewController(withIdentifier: "movie") as! ViewController
        vc.movie = (moviesArray?[indexPath.row])!
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
}

// MARK: - Search Bar
extension TopPopularMoviesViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        moviesArray = []
        if searchText == "" {
            moviesArray = searchArray
        }
        for movie in searchArray ?? [] {
            if movie.title!.uppercased().contains(searchText.uppercased()){
                moviesArray?.append(movie)
            }
        }
        self.MoviesCollectionView.reloadData()
    }
}
