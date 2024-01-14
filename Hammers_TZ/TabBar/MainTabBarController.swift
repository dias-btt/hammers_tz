//
//  MainTabBarController.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//
import UIKit

open class MainTabBarController: UITabBarController {
    public override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)

        // TODO: use common colors
        tabBar.tintColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        tabBar.backgroundColor = .systemBackground
    }
}
