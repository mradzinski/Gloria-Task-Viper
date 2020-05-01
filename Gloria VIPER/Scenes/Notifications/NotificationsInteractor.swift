//
//  NotificationsInteractor.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

final class NotificationsInteractor: NotificationsInteractorInputInterface {
    weak var presenter: NotificationsInteractorOutputInterface?
    
    func getNotifications() {
        presenter?.didGetNotifications(DataSource.getAllNotifications())
    }
    
    func setNotificationAsRead(_ notification: Notification) {
        DataSource.setNotificationAsRead(notification)
    }
}
