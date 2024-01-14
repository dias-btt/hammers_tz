//
//  TabBarRouter.swift
//  Hammers_TZ
//
//  Created by Диас Сайынов on 12.01.2024.
//

import Foundation

import UIKit

public protocol TabBarRouterProtocol {
    var viewController: UITabBarController? { get set }
    static func build() -> UIViewController
}

class TabBarRouter: TabBarRouterProtocol {
    weak public var viewController: UITabBarController?

    init(viewController: MainTabBarController) {
        self.viewController = viewController
    }

    public static func build() -> UIViewController {
        let view = MainTabBarController()
        let feedVC = FeedRouter.createModule()
        
        feedVC.tabBarItem = UITabBarItem(
            title: "Меню",
            image: UIImage(named: "menu"),
            tag: 0
        )
        
        let contactsVC = UIViewController()
        contactsVC.tabBarItem = UITabBarItem(
            title: "Контакты",
            image: UIImage(named: "contact"),
            tag: 1
        )
        
        let profileVC = UIViewController()
        profileVC.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profile"),
            tag: 2
        )
        
        let basketVC = UIViewController()
        basketVC.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(named: "basket"),
            tag: 3
        )

        let controllers = [feedVC, contactsVC, profileVC, basketVC]

        view.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }

        let router = TabBarRouter(viewController: view)
        router.viewController = view

        return view
    }

}
