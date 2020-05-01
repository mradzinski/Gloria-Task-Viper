//
//  AppDelegate.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import UIKit
import Hero

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        setupWireframe()
        
//        Hero.shared.defaultAnimation = .fade
        
        return true
    }
}

extension AppDelegate {
    func setupWireframe() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootNavigationController = UINavigationController()
        let tabbarWireframe = TabbarWireframe()
        
        rootNavigationController.setNavigationBarHidden(true, animated: false)
        
        tabbarWireframe.navigationController = rootNavigationController
        tabbarWireframe.pushOnNavigationController()
        
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
    }
}
