//
//  Notification.swift
//  gloria
//
//  Created by Matias Radzinski on 4/24/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation

enum NotificationType {
    case profile
    case like
    case follower
    case challenge
    case videoWeLike
    case profileWeLike
    case other
}

struct Notification: Equatable {
    var id: Int
    var type: NotificationType
    var body: String
    var thumbnail: String
    var isRead: Bool
    var user: User?
    
    static func == (lhs: Notification, rhs: Notification) -> Bool {
        lhs.id == rhs.id
    }
}
