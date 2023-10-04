//
//  AppDelegate.swift
//  LackTraining
//
//  Created by User on 25/09/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: routeToMainListView())
        window?.makeKeyAndVisible()
        return true
    }
    
    private func routeToMainListView() -> UIViewController{
       let storyBoard = UIStoryboard(name: "main", bundle: nil)
        guard let controller = storyBoard.instantiateViewController(withIdentifier: "MainList") as? MainListViewController else { return ViewController() }
        return controller
    }

}

