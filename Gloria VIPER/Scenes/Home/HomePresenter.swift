//
//  HomePresenter.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class HomePresenter: HomeViewDelegateInterface {
    internal var _wireframe: HomeWireframeInterface
    internal unowned var _view: HomeViewInterface
    internal var _interactor: HomeInteractorInterface?
    
    init(wireframe: HomeWireframeInterface, view: HomeViewInterface, interactor: HomeInteractorInterface? = nil) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
    }
}

extension HomePresenter {
    func didPressOpenNotifications() {
        _wireframe.navigateToNotificationsViewController()
    }
}
