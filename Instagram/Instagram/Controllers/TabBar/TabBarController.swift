//
//  TabBarController.swift
//  Instagram
//
//  Created by 변주현 on 2022/04/17.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
    }
    
    private func setDelegate() {
        self.delegate = self
    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if selectedIndex == 2 {
            tabBar.backgroundColor = .black
            tabBar.barTintColor = .white
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        } else {
            tabBar.backgroundColor = .white
            tabBar.barTintColor = .black
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
    }
}
