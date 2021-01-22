//
//  MainTabBarController.swift
//  gombang
//
//  Created by 정나눔 on 2021/01/22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeNavigation=UINavigationController.init(rootViewController: HomeView())
        let searchNavigation=UINavigationController.init(rootViewController: SearchView())
        let categoryNavigation=UINavigationController.init(rootViewController: CategoryView())
        
        self.viewControllers=[homeNavigation, searchNavigation,categoryNavigation]
        
        let homeTabBarItem=UITabBarItem(title: "홈", image: UIImage(systemName: "homekit.fill"), tag: 0)
        let searchTabBarItem=UITabBarItem(title: "검색", image: UIImage(systemName: "message.fill"), tag: 0)
        let categoryTabBarItem=UITabBarItem(title: "분류", image: UIImage(systemName: "star.fill"), tag: 0)
        // Do any additional setup after loading the view.
        
        homeNavigation.tabBarItem=homeTabBarItem
        searchNavigation.tabBarItem=searchTabBarItem
        categoryNavigation.tabBarItem=categoryTabBarItem
    }
}
