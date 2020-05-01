//
//  TabbarInterfaces.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

protocol TabbarWireframeInterface: WireframeInterface {
    func navigateToNotifications()
}

protocol TabbarViewInterface: ViewInterface {
    var presenter: TabbarViewDelegateInterface! { get set }
}

protocol TabbarViewDelegateInterface: PresenterInterface {
    var _wireframe: TabbarWireframeInterface { get }
    var _view: TabbarViewInterface { get }
    var _interactor: TabbarInteractorInterface? { get }
}

protocol TabbarInteractorInterface: InputInteractorInterface {
}
