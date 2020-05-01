//
//  TabbarWireframe.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

final class TabbarWireframe: TabbarWireframeInterface {
    private let defaultSelectedTabButton: UInt = 0
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    var storyboard:UIStoryboard {
        return UIStoryboard.init(name: "Tabbar", bundle: nil)
    }
    
    fileprivate lazy var _tabbarItems: [TabbarItem] = [
        TabbarItem(title: "Home", icon: "house", selectedIcon: "house.fill", wireframe: HomeWireframe()),
        TabbarItem(title: "About", icon: "questionmark", selectedIcon: "questionmark.fill", wireframe: AboutWireframe())
    ]
    
    internal func instantiateViewController<T>(_ context: T) -> UIViewController {
        let tabbarController = storyboard.instantiateViewController(withIdentifier: TabbarControllerIdentifier) as! TabbarController

        let interactor = TabbarInteractor()
        let presenter = TabbarPresenter(wireframe: self, view: tabbarController, interactor: interactor)

        tabbarController.presenter = presenter
        tabbarController.viewControllers = self._setupTabbarViewController()
        self._setupTabbar(tabbarController.navigationBar)

        tabbarController.selectedIndex = defaultSelectedTabButton

        return tabbarController
    }
}

extension TabbarWireframe {
    func navigateToNotifications() {
        
    }
}

extension TabbarWireframe {
    fileprivate func _setupTabbarViewController() -> [UIViewController] {
        return _tabbarItems.map { item in
            let navigationController = UINavigationController()
            
            navigationController.setNavigationBarHidden(true, animated: false)
            
            item._wireframe.navigationController = navigationController
            item._wireframe.pushOnNavigationController()
            
            return navigationController
        }
    }
    
    fileprivate func _setupTabbar(_ tabbar: MDCBottomNavigationBar) {
        tabbar.items.forEach { item in
            let theItem = tabbar.items.firstIndex(of: item)
            
            if (theItem != nil) {
                let tabItem = _tabbarItems[theItem!]
        
                item.image = tabItem._icon
                item.selectedImage = tabItem._selectedIcon
                
                if tabItem._title != nil {
                    item.title = tabItem._title
                }
            }
        }
        
        tabbar.selectedItemTintColor = UIColor.black
        tabbar.unselectedItemTintColor = UIColor.lightGray
        tabbar.titleVisibility = .always
    }
}

fileprivate final class TabbarItem {
    var _icon: UIImage?
    var _selectedIcon: UIImage?
    var _wireframe: WireframeInterface
    var _title: String?
    
    init(icon: String, selectedIcon: String, wireframe: WireframeInterface) {
        self._icon = UIImage(named: icon)
        self._selectedIcon = UIImage(named: selectedIcon)
        self._wireframe = wireframe
    }
    
    init(title: String, icon: String, selectedIcon: String, wireframe: WireframeInterface) {
        self._title = title
        self._icon = UIImage(named: icon)
        self._selectedIcon = UIImage(named: selectedIcon)
        self._wireframe = wireframe
    }
}
