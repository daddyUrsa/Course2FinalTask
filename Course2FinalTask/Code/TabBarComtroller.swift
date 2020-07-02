//
//  TabBarComtrollerViewController.swift
//  Course2FinalTask
//
//  Created by Alexey Golovin on 25.06.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabsSetup()
    }
}

extension TabBarController {
    
    func tabsSetup() {
        let firstTabView = FeedViewController()
        let secondTabView = ProfileView()
        
        firstTabView.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "feed"), tag: 0)
        secondTabView.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 1)
     
        let tabBarList = [firstTabView, secondTabView]
        self.viewControllers = tabBarList
    }
}
