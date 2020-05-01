//
//  NotificationsPresenter.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class NotificationsPresenter: NotificationsViewDelegateInterface {
    internal var _wireframe: NotificationsWireframeInterface
    internal unowned var _view: NotificationsViewInterface
    internal var _interactor: NotificationsInteractorInputInterface?
    
    init(wireframe: NotificationsWireframeInterface, view: NotificationsViewInterface, interactor: NotificationsInteractorInputInterface? = nil) {
        self._wireframe = wireframe
        self._view = view
        self._interactor = interactor
        self._interactor?.presenter = self
    }
    
    func getNotifications() {
        self._interactor?.getNotifications()
    }
    
    func didPressOnNotification(_ notification: Notification) {
        if notification.type == .profile, let user = notification.user {
            self._wireframe.navigateToProfileController(user)
            self._interactor?.setNotificationAsRead(notification)
        }
    }
    
    func didPressOnCloseButton() {
        self._wireframe.dismissViewController()
    }
}

extension NotificationsPresenter: NotificationsInteractorOutputInterface {
    func didGetNotifications(_ notifications: [Notification]) {
        self._view.showNotifications(notifications)
    }
}
