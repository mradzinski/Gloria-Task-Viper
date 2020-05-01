//
//  WireframeInterface.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

protocol WireframeInterface: class {
    
    // MARK: REQUIRED
    var storyboard: UIStoryboard { get }
    var navigationController: UINavigationController? { get set }
    var viewController: UIViewController? { get set }
    
    init()
    
    func instantiateViewController<T>(_ context: T?) -> UIViewController
}

extension WireframeInterface {
    
    // MARK: CONVENIENCE INIT
    init(navigationController: UINavigationController? = nil) {
        self.init()
        self.navigationController = navigationController
    }
    
    // MARK: PUSH
    func pushOnNavigationController() {
        navigationController?.pushViewController(instantiateViewController(nil as AnyObject?), animated: true)
    }
    
    func pushOnNavigationController<T>(_ context: T?) {
        navigationController?.pushViewController(instantiateViewController(context), animated: true)
    }
    
    // MARK: POP
    func popFromNavigationController() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: PRESENT
    func presentFromViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.present(instantiateViewController(nil as AnyObject?), animated: animated, completion: nil)
    }
    
    func presentFromViewController<T>(_ viewController: UIViewController, context: T, animated: Bool) {
        viewController.present(instantiateViewController(context), animated: animated, completion: nil)
    }
    
    func presentFromViewControllerWithStyle(_ viewController: UIViewController, style: UIModalPresentationStyle, animated: Bool) {
        let vc = instantiateViewController(nil as AnyObject?)
        
        vc.modalPresentationStyle = style
        
        viewController.present(vc, animated: animated)
    }
    
    // MARK: DISMISS
    func dismissViewController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}

