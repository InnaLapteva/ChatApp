//
//  MainTabBarViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 14.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let peopleVC = PeopleViewController()
        let listVC = ListViewController()
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)!
        let conversationImage = UIImage(systemName: "bubble.left.and.bubble.right.fill", withConfiguration: boldConfig)!
        
        viewControllers = [generationNavigationController(rootVC: peopleVC, title: "People", image: peopleImage),
                           generationNavigationController(rootVC: listVC, title: "Conversation", image: conversationImage)]
    }
    
    private func generationNavigationController(rootVC: UIViewController, title: String, image: UIImage) -> UIViewController {
     
        let navigationVC = UINavigationController(rootViewController: rootVC)
        
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }

}
