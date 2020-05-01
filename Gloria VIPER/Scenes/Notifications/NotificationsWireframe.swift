//
//  NotificationsWireframe.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

final class NotificationsWireframe: NotificationsWireframeInterface {
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    var storyboard: UIStoryboard {
        return UIStoryboard.init(name: "Notifications", bundle: nil)
    }
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        guard let notificationsViewController = storyboard.instantiateViewController(
            withIdentifier: NotificationsControllerIdentifier) as? NotificationsController else { return UIViewController() }
        
        let interactor = NotificationsInteractor()
        let presenter = NotificationsPresenter(wireframe: self, view: notificationsViewController, interactor:interactor)
        
        notificationsViewController.presenter = presenter
        
        self.viewController = notificationsViewController
        
        return notificationsViewController
    }
}

extension NotificationsWireframe {
    func navigateToProfileController(_ user: User) {
        if let nc = self.navigationController, let vc = self.viewController {
            ProfileWireframe(user: user, navigationController: nc)
                .presentFromViewControllerWithStyle(vc, style: .fullScreen, animated: true)
        }
    }
}
