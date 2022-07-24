//
//  TabBarViewController.swift
//  Dewy
//
//  Created by Vanessa Putnam on 7/24/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private enum Tab {
        case home
        case profile
        
        var title: String {
            switch self {
            case .home: return "Home"
            case .profile: return "Profile"
            }
        }
        
        var icon: UIImage {
            switch self {
            case .home: return UIImage(systemName: "house")!
            case .profile: return UIImage(systemName: "person")!
            }
        }
        
        var viewController: UIViewController {
            switch self {
            case .home: return HomeViewController.viewController()
            case .profile: return UIViewController()
            }
        }
    }
    
    class func viewController() -> TabBarViewController {
        return TabBarViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        viewControllers = setupViewControllers()
    }
    
    private func setupViewControllers() -> [UIViewController] {
        return [
            navigationController(for: Tab.home),
            navigationController(for: Tab.profile),
        ]
    }
    
    private func navigationController(for tab: Tab) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: tab.viewController)
        navigationController.tabBarItem.title = tab.title
        navigationController.tabBarItem.image = tab.icon
        
        return navigationController
    }
}
