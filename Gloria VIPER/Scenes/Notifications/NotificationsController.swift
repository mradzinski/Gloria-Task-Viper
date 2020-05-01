//
//  NotificationsController.swift
//  Gloria VIPER
//
//  Created by Matias Radzinski on 4/30/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit

final class NotificationsController: UIViewController {
    var presenter: NotificationsViewDelegateInterface?
    
    var isCellAnimationCompleted = false
    
    var notifications: [Notification] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NotificationCell", bundle: nil), forCellReuseIdentifier: "NotificationCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getNotifications()
    }
}

extension NotificationsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! NotificationCell
        
        cell.setupNotification(notifications[indexPath.item])
        
        return cell
    }
}

extension NotificationsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !self.isCellAnimationCompleted {
            let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.5, delayFactor: 0.05)
            let animator = Animator(animation: animation)
            
            animator.animate(cell: cell, at: indexPath, in: tableView)
            self.isCellAnimationCompleted = animator.hasAnimatedAllCells
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let notification = notifications[indexPath.row] as Notification? {
            presenter?.didPressOnNotification(notification)
        }
    }
}

extension NotificationsController: NotificationsViewInterface {
    func showNotifications(_ notifications: [Notification]) {
        self.notifications = notifications
    }
}

extension NotificationsController {
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.presenter?.didPressOnCloseButton()
    }
}
