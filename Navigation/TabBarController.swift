//
//  TabBarController.swift
//  Navigation
//
//  Created by Бардеева Надежда on 26.04.2022.
//

import UIKit

class TabBarController: UITabBarController {

    let feedVC = FeedViewController()
    let logInVC = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    private func setupControllers() {
        let navigationFeedController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(named: "newspaper")
        feedVC.navigationItem.title = "Лента"

        let navigationProfileController = UINavigationController(rootViewController: logInVC)
        logInVC.tabBarItem.title = "Профиль"
        logInVC.tabBarItem.image = UIImage(named: "person")
        navigationProfileController.navigationBar.isHidden = true
        viewControllers = [navigationFeedController, navigationProfileController]
    }

}
