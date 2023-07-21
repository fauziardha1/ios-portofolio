//
//  AppDelegate.swift
//  bangunin
//
//  Created by Fauzi Arda on 22/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.clearLaunchScreenCache()
        setupMiddleLaunchScreen(window: &window)
        setupRootApp(window: &window)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        window?.isHidden = true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        window?.isHidden = false
    }
    
}

extension AppDelegate {
    func setupRootApp(window: inout UIWindow?) {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        setupTabBar(window: &window)
    }
    
    func setupTabBar(window: inout UIWindow?){
        let tabBarController = UITabBarController()
       
        
        // create tabBar item
        let homeItem = UITabBarItem()
        homeItem.title = "Home"
        homeItem.image = UIImage(named: "icon_home")
        
        let alarmsItem = UITabBarItem()
        alarmsItem.title = "Alarms"
        alarmsItem.image = UIImage(named: "icon_list")
        
        let homeVC = HomeViewController()
        let alarmsVC = AlarmsViewController()
        
        homeVC.tabBarItem = homeItem
        alarmsVC.tabBarItem = alarmsItem
        
        tabBarController.viewControllers = [homeVC, alarmsVC]
        
        tabBarController.selectedIndex = 0
        tabBarController.tabBar.backgroundColor = .white
        
        window?.rootViewController = UINavigationController(rootViewController: tabBarController)
        window?.makeKeyAndVisible()
    }
}

public extension UIApplication {

    func clearLaunchScreenCache() {
        do {
            try FileManager.default.removeItem(atPath: NSHomeDirectory()+"/Library/SplashBoard")
            sleep(2)
        } catch {
            print("Failed to delete launch screen cache: \(error)")
        }
    }

}
