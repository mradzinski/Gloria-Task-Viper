//
//  HomeInterfaces.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

protocol HomeWireframeInterface: WireframeInterface {
    func navigateToNotificationsViewController()
}

protocol HomeViewInterface: ViewInterface {
    var presenter: HomeViewDelegateInterface? { get set }
}

protocol HomeViewDelegateInterface: PresenterInterface {
    var _wireframe: HomeWireframeInterface { get }
    var _view: HomeViewInterface { get }
    var _interactor: HomeInteractorInterface? { get }
    
    func didPressOpenNotifications()
}

protocol HomeInteractorInterface: InputInteractorInterface {
}
