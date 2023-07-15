//
//  LaunchScreenViewController.swift
//  bangunin
//
//  Created by Fauzi Arda on 10/07/23.
//

import Foundation
import UIKit

func setupMiddleLaunchScreen(window: inout UIWindow?) {
    let controller = UIViewController()
    
    let image = UIImageView(image: UIImage(named: "splash"))
    image.contentMode = .scaleAspectFill
    controller.view.backgroundColor = UIColor.init(named: "BackgroundSplash")
    
    controller.view.addSubview(image)
    NSLayoutConstraint.activate([
        image.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor),
        image.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor)
    ])
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = controller
    window?.makeKeyAndVisible()
}
