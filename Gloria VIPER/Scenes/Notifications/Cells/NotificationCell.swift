//
//  NotificationCell.swift
//  gloria
//
//  Created by Matias Radzinski on 4/24/20.
//  Copyright © 2020 Gloria. All rights reserved.
//

import Foundation
import UIKit
import Hero

class NotificationCell: UITableViewCell {
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var isReadImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupNotification(_ notification: Notification) {
        isReadImageView.layer.cornerRadius = 4
        bodyLabel.attributedText = notification.body.htmlAttributedString()
        thumbnailImageView.image = UIImage(named: notification.thumbnail)
        isReadImageView.isHidden = notification.isRead
        
        thumbnailImageView.hero.id = "\(heroIdForThumbnails)\(notification.user?.id ?? -1)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
    }
}
