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
        
        tabBar.isOpaque = true
        tabBar.isTranslucent = false
        
        let homeController = navigationController(viewController: HomeController(), imageName: "house", title: "Home")
        let comingSoonController = navigationController(viewController: ComingSoonController(), imageName: "calendar", title: "Coming Soon")
        let downloadsController = navigationController(viewController: UIViewController(), imageName: "square.and.arrow.down", title: "Downloads")
        let listController = navigationController(viewController: UIViewController(), imageName: "tv", title: "My List")
        let moreController = navigationController(viewController: UIViewController(), imageName: "ellipsis.circle", title: "More")
        
        viewControllers = [
            homeController,
            listController,
            comingSoonController,
            downloadsController,
            moreController
        ]
    }
    
    
    fileprivate func navigationController(viewController: UIViewController, imageName: String, title: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .black
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: imageName)
        return navigationController
    }
    
}
