//
//  MainTabBarController.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 16/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barStyle = .black
        tabBar.tintColor = .white
        
        let homeController = navigationController(viewController: HomeController(), imageName: "house", title: "Home")
        let comingSoonController = navigationController(viewController: UIViewController(), imageName: "calendar", title: "Coming Soon")
        
        viewControllers = [homeController, comingSoonController]
    }
    
    
    fileprivate func navigationController(viewController: UIViewController, imageName: String, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .black
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        return navigationController
    }
    
}
