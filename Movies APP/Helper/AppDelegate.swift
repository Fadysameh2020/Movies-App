//
//  AppDelegate.swift
//  Movies APP
//
//  Created by MESHO on 14/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
//
//        print(url)
//
//        return true
//    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        if url.scheme == "moviesapptask", // Replace with your app's custom URL scheme
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems,
            let movieId = queryItems.first(where: { $0.name == "movieId" })?.value {
            
            // Perform actions based on the movie ID
//            if let navigationController = window?.rootViewController as? UINavigationController {
//                // Navigate to the movie detail screen with the movie ID
//                let movieDetailViewController = ViewController()
//                movieDetailViewController.movieID = movieId
//                navigationController.pushViewController(movieDetailViewController, animated: true)
//            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
                        let movieDetailViewController = storyboard.instantiateViewController(withIdentifier: "movie") as! ViewController
                        movieDetailViewController.movieID = movieId // Pass the movie ID to the detail view controller
                        
                        // Navigate to the movie details screen
                        if let navigationController = window?.rootViewController as? UINavigationController {
                            navigationController.pushViewController(movieDetailViewController, animated: true)
                        }
            
            
            
            return true
        }
        
        return false
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

