//
//  NotificationsInterfaces.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

protocol NotificationsWireframeInterface: WireframeInterface {
    func navigateToProfileController(_ user: User)
}

protocol NotificationsViewInterface: ViewInterface {
    var presenter: NotificationsViewDelegateInterface? { get set }
    
    func showNotifications(_ notifications: [Notification])
}

protocol NotificationsViewDelegateInterface: PresenterInterface {
    var _wireframe: NotificationsWireframeInterface { get }
    var _view: NotificationsViewInterface { get }
    var _interactor: NotificationsInteractorInputInterface? { get }
    
    func getNotifications()
    func didPressOnNotification(_ notification: Notification)
    func didPressOnCloseButton()
}

protocol NotificationsInteractorInputInterface: InputInteractorInterface {
    var presenter: NotificationsInteractorOutputInterface? { get set }
    
    func getNotifications()
    func setNotificationAsRead(_ notification: Notification)
}

protocol NotificationsInteractorOutputInterface: OutputInteractorInterface {
    func didGetNotifications(_ notifications: [Notification])
}
