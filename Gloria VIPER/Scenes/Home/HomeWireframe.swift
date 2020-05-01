//
//  HomeWireframe.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit
import os.log

final class HomeWireframe: HomeWireframeInterface {
    
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    var storyboard: UIStoryboard {
        return UIStoryboard.init(name: "Home", bundle: nil)
    }
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: HomeControllerIdentifier) as? HomeController else { return UIViewController() }
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(wireframe: self, view: homeViewController, interactor:interactor)
        
        homeViewController.presenter = presenter
        
        return homeViewController
    }
}

extension HomeWireframe {
    func navigateToNotificationsViewController() {
        if let nc = self.navigationController {
            NotificationsWireframe(navigationController: self.navigationController)
                .presentFromViewControllerWithStyle(nc, style: .fullScreen, animated: true)
        }
    }
}
