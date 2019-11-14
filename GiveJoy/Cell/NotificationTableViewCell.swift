//
//  NotificationTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 17/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var notificationNameLabel: UILabel!
    @IBOutlet weak var notificationTimeLabel: UILabel!
    @IBOutlet weak var notiftionDislikeImageView: UIImageView!
    @IBOutlet weak var notifactionCommentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
