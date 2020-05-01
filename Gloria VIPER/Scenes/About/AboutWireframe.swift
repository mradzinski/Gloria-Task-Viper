//
//  AboutWireframe.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class AboutWireframe: AboutWireframeInterface {
    weak var navigationController: UINavigationController?
    weak var viewController: UIViewController?
    
    var storyboard: UIStoryboard {
        return UIStoryboard.init(name: "About", bundle: nil)
    }
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController {
        guard let aboutViewController = storyboard.instantiateViewController(withIdentifier: AboutControllerIdentifier) as? AboutController else { return UIViewController() }
        
        let presenter = AboutPresenter(wireframe: self, view: aboutViewController)
        
        aboutViewController.presenter = presenter
        
        return aboutViewController
    }
}
