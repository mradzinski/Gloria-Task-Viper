//
//  ProfileWireframe.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

final class ProfileWireframe: ProfileWireframeInterface {
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    fileprivate var userId: Int?
    
    var storyboard: UIStoryboard {
        return UIStoryboard.init(name: "Profile", bundle: nil)
    }
    
    convenience init(user: User, navigationController: UINavigationController? = nil) {
        self.init()
        self.navigationController = navigationController
        self.userId = user.id
    }
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        guard let profileViewController = storyboard.instantiateViewController(
            withIdentifier: ProfileControllerIdentifier) as? ProfileController else { return UIViewController() }
        
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(wireframe: self, view: profileViewController, interactor:interactor)
        
        profileViewController.presenter = presenter
        profileViewController.userId = self.userId
        
        self.viewController = profileViewController
        
        return profileViewController
    }
}
